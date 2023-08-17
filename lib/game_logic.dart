import 'dart:math';

class Player {
  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool contain(int x, int y, [z]) {
    return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  String checkWinner() {
    String winner = '';
    if (Player.playerX.contain(0, 1, 2) ||
        Player.playerX.contain(3, 4, 5) ||
        Player.playerX.contain(6, 7, 8) ||
        Player.playerX.contain(0, 3, 6) ||
        Player.playerX.contain(1, 4, 7) ||
        Player.playerX.contain(2, 5, 8) ||
        Player.playerX.contain(0, 4, 8) ||
        Player.playerX.contain(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.contain(0, 1, 2) ||
        Player.playerO.contain(3, 4, 5) ||
        Player.playerO.contain(6, 7, 8) ||
        Player.playerO.contain(0, 3, 6) ||
        Player.playerO.contain(1, 4, 7) ||
        Player.playerO.contain(2, 5, 8) ||
        Player.playerO.contain(0, 4, 8) ||
        Player.playerO.contain(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
    return winner;
  }

  void runGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  Future<void> autoPlay(String activePlayer) async {
    int index = 0;
    List<int> listComputer = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        listComputer.add(i);
      }
    }

    //position vertical

    // Left
    if (Player.playerX.contain(0, 1) && listComputer.contains(2))
      index = 2;
    else if (Player.playerX.contain(3, 4) && listComputer.contains(5))
      index = 5;
    else if (Player.playerX.contain(6, 7) && listComputer.contains(8))
      index = 8;

    // Right
    else if (Player.playerX.contain(2, 1) && listComputer.contains(0))
      index = 0;
    else if (Player.playerX.contain(5, 4) && listComputer.contains(3))
      index = 3;
    else if (Player.playerX.contain(7, 8) && listComputer.contains(6))
      index = 6;

    // center
    else if (Player.playerX.contain(0, 2) && listComputer.contains(1))
      index = 1;
    else if (Player.playerX.contain(3, 5) && listComputer.contains(4))
      index = 4;
    else if (Player.playerX.contain(6, 8) && listComputer.contains(7))
      index = 7;

    //position horizontal

    // top
    if (Player.playerX.contain(0, 3) && listComputer.contains(6))
      index = 6;
    else if (Player.playerX.contain(1, 4) && listComputer.contains(7))
      index = 7;
    else if (Player.playerX.contain(2, 5) && listComputer.contains(8))
      index = 8;

    // bottom
    else if (Player.playerX.contain(6, 3) && listComputer.contains(0))
      index = 0;
    else if (Player.playerX.contain(7, 4) && listComputer.contains(1))
      index = 1;
    else if (Player.playerX.contain(5, 8) && listComputer.contains(2))
      index = 2;

    // center
    else if (Player.playerX.contain(0, 6) && listComputer.contains(3))
      index = 3;
    else if (Player.playerX.contain(1, 7) && listComputer.contains(4))
      index = 4;
    else if (Player.playerX.contain(2, 8) && listComputer.contains(5))
      index = 5;

    //position vertical

    // Left
    if (Player.playerO.contain(0, 1) && listComputer.contains(2))
      index = 2;
    else if (Player.playerO.contain(3, 4) && listComputer.contains(5))
      index = 5;
    else if (Player.playerO.contain(6, 7) && listComputer.contains(8))
      index = 8;

    // Right
    else if (Player.playerO.contain(2, 1) && listComputer.contains(0))
      index = 0;
    else if (Player.playerO.contain(5, 4) && listComputer.contains(3))
      index = 3;
    else if (Player.playerO.contain(7, 8) && listComputer.contains(6))
      index = 6;

    // center
    else if (Player.playerO.contain(0, 2) && listComputer.contains(1))
      index = 1;
    else if (Player.playerO.contain(3, 5) && listComputer.contains(4))
      index = 4;
    else if (Player.playerO.contain(6, 8) && listComputer.contains(7))
      index = 7;

    //position horizontal

    // top
    if (Player.playerO.contain(0, 3) && listComputer.contains(6))
      index = 6;
    else if (Player.playerO.contain(1, 4) && listComputer.contains(7))
      index = 7;
    else if (Player.playerO.contain(2, 5) && listComputer.contains(8))
      index = 8;

    // bottom
    else if (Player.playerO.contain(6, 3) && listComputer.contains(0))
      index = 0;
    else if (Player.playerO.contain(7, 4) && listComputer.contains(1))
      index = 1;
    else if (Player.playerO.contain(5, 8) && listComputer.contains(2))
      index = 2;

    // center
    else if (Player.playerO.contain(0, 6) && listComputer.contains(3))
      index = 3;
    else if (Player.playerO.contain(1, 7) && listComputer.contains(4))
      index = 4;
    else if (Player.playerO.contain(2, 8) && listComputer.contains(5))
      index = 5;
    else {
      Random random = Random();
      int indexRandom = random.nextInt(listComputer.length);
      index = listComputer[indexRandom];
      runGame(index, activePlayer);
    }
  }
}
