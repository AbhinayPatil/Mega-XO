import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  late String currentPlayer;
  late String wonBy;

  MyProvider({
    this.currentPlayer = "X",
    this.wonBy = "",
  });

  void changePlayer(String temp) {
    if (temp == "X") {
      currentPlayer = "X";
    }
    if (temp == "O") {
      currentPlayer = "O";
    }
    notifyListeners();
  }

  void declareWinner(String temp) {
    wonBy = temp;
    notifyListeners();
  }
}
