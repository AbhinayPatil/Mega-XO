import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/game_provider.dart';
import 'package:xo_game/widgets/info_box.dart';

class PlayArea extends StatefulWidget {
  const PlayArea({super.key});

  @override
  State<PlayArea> createState() => _PlayAreaState();
}

class _PlayAreaState extends State<PlayArea> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  // bigger tile index is from 0-9 (9 main boxex)
  //inner box index is from 0-9(9 boxes within a main box)

  bool gameStarted = true;
  String gameWinner = "";
  String currentChance = "X";
  late int activeBigBox = 9; // value 9 for initial case (0-8 are playing index)

  var singleBigBoxStatus = [
    for (int column = 0; column < 10; column += 1) "playable"
  ]; //status of 9 big boxes

  var isOcuppied = [
    for (int row = 0; row < 9; row += 1)
      [for (int column = 0; column < 9; column += 1) "false"],
  ]; // is occuppy status of each unit box(small) box

  var value = [
    for (var row = 0; row < 9; row += 1)
      [for (var column = 0; column < 9; column += 1) ""],
  ]; // value of ech unit box

  //code block for checking status of a big box -- code block start
  //**************************
  int flag = 0;
  var winningList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  void checkSingleBoxWinner(int index) {
    //checking win for x
    for (var pos in winningList) {
      if ("X" == value[index][pos[0]] &&
          "X" == value[index][pos[1]] &&
          "X" == value[index][pos[2]]) {
        singleBigBoxStatus[index] = "wonByX";
        for (int j = 0; j < 9; j++) {
          isOcuppied[index][j] = "true";
        }
        return;
      }
    }

    //checking win for O
    for (var pos in winningList) {
      if ("O" == value[index][pos[0]] &&
          "O" == value[index][pos[1]] &&
          "O" == value[index][pos[2]]) {
        singleBigBoxStatus[index] = "wonByO";
        for (int j = 0; j < 9; j++) {
          isOcuppied[index][j] = "true";
        }
        return;
      }
    }

    //remaining cases either full or playable
    flag = 0;
    for (int i = 0; i < 9; i++) {
      if (value[index][i] == "") {
        flag = 1;
      }
    }
    if (flag == 1) {
      singleBigBoxStatus[index] = "playable";
      return;
    } else {
      singleBigBoxStatus[index] = "tie";
    }
  }
  //**************************
  //code block end

  void checkingGameWinner() {
    for (var pos in winningList) {
      if ("wonByX" == singleBigBoxStatus[pos[0]] &&
          "wonByX" == singleBigBoxStatus[pos[1]] &&
          "wonByX" == singleBigBoxStatus[pos[2]]) {
        gameWinner = "X";
        gameStarted = false;
        Provider.of<MyProvider>(context, listen: false)
            .declareWinner(gameWinner);
        return;
      }
    }

    for (var pos in winningList) {
      if ("wonByO" == singleBigBoxStatus[pos[0]] &&
          "wonByO" == singleBigBoxStatus[pos[1]] &&
          "wonByO" == singleBigBoxStatus[pos[2]]) {
        gameWinner = "O";
        gameStarted = false;
        Provider.of<MyProvider>(context, listen: false)
            .declareWinner(gameWinner);
        return;
      }
    }
  }

  //latout of single unit tile
  //code block start ****************************************
  Widget SingleTile(int biggerTileIndex, int innerTileIndex) {
    return InkWell(
      onTap: () {
        if (gameStarted == true) {
          setState(() {
            //InfoBox(currentChance);
            if (isOcuppied[biggerTileIndex][innerTileIndex] == "false" &&
                (activeBigBox == biggerTileIndex || activeBigBox == 9) &&
                singleBigBoxStatus[activeBigBox] == "playable") {
              isOcuppied[biggerTileIndex][innerTileIndex] = "true";
              activeBigBox = innerTileIndex;
              if (currentChance == "X") {
                value[biggerTileIndex][innerTileIndex] = "X";
                currentChance = "O";
                Provider.of<MyProvider>(context, listen: false)
                    .changePlayer(currentChance);
                checkSingleBoxWinner(biggerTileIndex);
                checkingGameWinner();
                return;
              } else if (currentChance == "O") {
                value[biggerTileIndex][innerTileIndex] = "O";
                currentChance = "X";
                Provider.of<MyProvider>(context, listen: false)
                    .changePlayer(currentChance);
                checkSingleBoxWinner(biggerTileIndex);
                checkingGameWinner();
                return;
              }
              return;
            } else if (isOcuppied[biggerTileIndex][innerTileIndex] == "false" &&
                singleBigBoxStatus[activeBigBox] != "playable") {
              isOcuppied[biggerTileIndex][innerTileIndex] = "true";
              activeBigBox = innerTileIndex;
              if (currentChance == "X") {
                value[biggerTileIndex][innerTileIndex] = "X";
                currentChance = "O";
                Provider.of<MyProvider>(context, listen: false)
                    .changePlayer(currentChance);
                checkSingleBoxWinner(biggerTileIndex);
                checkingGameWinner();
                return;
              } else if (currentChance == "O") {
                value[biggerTileIndex][innerTileIndex] = "O";
                currentChance = "X";
                Provider.of<MyProvider>(context, listen: false)
                    .changePlayer(currentChance);
                checkSingleBoxWinner(biggerTileIndex);
                checkingGameWinner();
                return;
              }
              return;
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            color: (isOcuppied[biggerTileIndex][innerTileIndex] == "true")
                ? Colors.blueAccent
                : Colors.transparent,
            border: Border.all(color: Colors.lightBlueAccent)),
        child: Center(
          child: Text(
            value[biggerTileIndex][innerTileIndex],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
  // code block ends *************************************************

  //layout of a big box
  //code block start ********************************
  Widget SingleBox(int biggerTileIndex) {
    if (singleBigBoxStatus[biggerTileIndex] == "wonByX") {
      return BigBox("X");
    } else if (singleBigBoxStatus[biggerTileIndex] == "wonByO") {
      return BigBox("O");
    } else if (singleBigBoxStatus[biggerTileIndex] == "tie") {
      return BigBox("-");
    } else {
      return Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
              width: (singleBigBoxStatus[activeBigBox] == "playable" &&
                      activeBigBox == biggerTileIndex)
                  ? 3
                  : .5,
              color: (singleBigBoxStatus[activeBigBox] == "playable" &&
                      activeBigBox == biggerTileIndex)
                  ? const Color.fromARGB(255, 112, 255, 2)
                  : const Color.fromARGB(255, 2, 1, 62)),
        ),
        width: MediaQuery.of(context).size.width * .27,
        height: MediaQuery.of(context).size.width * .27,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => SingleTile(biggerTileIndex, index),
          itemCount: 9,
        ),
      );
    }
  }

  // Container with different symbols
  Widget BigBox(String symbol) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 2, 1, 62)),
      ),
      width: MediaQuery.of(context).size.width * .27,
      height: MediaQuery.of(context).size.width * .27,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  //code block ends******************************************

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    if (_width > _height) {
      double temp = _width;
      _width = _height;
      _height = temp;
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: (singleBigBoxStatus[activeBigBox] != "playable") ? 3 : 1,
              color: (singleBigBoxStatus[activeBigBox] != "playable")
                  ? Colors.green
                  : Colors.transparent),
        ),
        height: _width * .9,
        width: _width * .9,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => SingleBox(index),
          itemCount: 9,
        ),
      ),
    );
  }
}
