import 'package:flutter/material.dart';

import 'package:x_and_o/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool swVale = false;
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context);
    List<Widget> listTop() {
      return [
        SwitchListTile.adaptive(
            activeColor: th.shadowColor,
            title: const Text(
              'Turn on / off two player mode',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            value: swVale,
            onChanged: (newValue) => setState(() {
                  swVale = newValue;
                })),
        const SizedBox(
          height: 20,
        ),
        Text(
          "it's $activePlayer turn ".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ];
    }

    List<Widget> listBottom() {
      return [
        Text(
          "$result",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: TextButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(th.shadowColor)),
            onPressed: () {
              setState(() {
                Player.playerX = [];
                Player.playerO = [];
                activePlayer = 'X';
                gameOver = false;
                turn = 0;
                result = '';
              });
            },
            icon: const Icon(
              Icons.replay,
              color: Colors.white,
            ),
            label: const Text(
              'Repeat the game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ];
    }

    Expanded gridExpanded() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio:3/3,
          children: List.generate(
              9,
              (index) => InkWell(
                    onTap: gameOver ? null : () => onTap(index),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: th.shadowColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        Player.playerX.contains(index)
                            ? 'X'
                            : Player.playerO.contains(index)
                                ? 'O'
                                : '',
                        style: TextStyle(
                            color: Player.playerX.contains(index)
                                ? Colors.white
                                : Colors.pink,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: th.primaryColor,
      body: SafeArea(
        child:MediaQuery.of(context).orientation==Orientation.portrait? Column(
          children: [
            ...listTop(),
           const SizedBox(
              height: 50,
            ),
            gridExpanded(),
            ...listBottom(),
          ],
        ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...listTop(),
                      ...listBottom(),
                    ],

                  ),
                ),
                gridExpanded(),
              ],
            )
      ),
    );
  }

  onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.runGame(index, activePlayer);
      update();
    }

    if (!swVale && !gameOver) {
      await game.autoPlay(activePlayer);
      update();
    }
  }

  update() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
    });
    String winner = game.checkWinner();
    if (winner != '') {
      gameOver = true;
      result = "It's winner $winner".toUpperCase();
    } else if (!gameOver && turn == 9) {
      result = "It's Draw!";
    }
  }
}
