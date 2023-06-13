import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/game_provider.dart';
import 'package:xo_game/rules.dart';

class InfoBox extends StatefulWidget {
  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  Widget displayerX(double _height, double _width) {
    return SizedBox(
      width: _width / 2,
      height: _height * .8,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: _width / 2,
              height: _height * .8,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/hippo.png"),
              minRadius: 50,
            ),
            Positioned(
              top: (_height * .8) / 2 + 30,
              child: Consumer<MyProvider>(
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade100,
                      border: (value.currentPlayer == "X")
                          ? Border.all(color: Colors.green, width: 5)
                          : Border.all(color: Colors.deepPurple, width: 3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: (value.wonBy == "X")
                              ? Column(
                                  children: const [
                                    Text(
                                      "Player X",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      "Winner",
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 24),
                                    ),
                                  ],
                                )
                              : const Text(
                                  "Player X",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayerY(double _height, double _width) {
    return SizedBox(
      width: _width / 2,
      height: _height * .8,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: _width / 2,
              height: _height * .8,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/seahorse.png"),
              minRadius: 50,
            ),
            Positioned(
              top: (_height * .8) / 2 + 30,
              child: Consumer<MyProvider>(
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade100,
                      border: (value.currentPlayer == "O")
                          ? Border.all(color: Colors.green, width: 5)
                          : Border.all(color: Colors.deepPurple, width: 3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: (value.wonBy == "O")
                              ? Column(
                                  children: const [
                                    Text(
                                      "Player O",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      "Winner",
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 24),
                                    ),
                                  ],
                                )
                              : const Text(
                                  "Player O",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height;
    double _width;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width - _height * 1.1;
    } else {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height - _width * .9;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          height: _height,
          width: _width,
          child: Wrap(
            children: [
              Row(
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: displayerX(_height, _width)),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: displayerY(_height, _width)),
                ],
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Phoenix.rebirth(context);
                        },
                        child: Container(
                          width: _width * .3,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent.shade100,
                            border:
                                Border.all(color: Colors.deepPurple, width: 3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Restart",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RulesScreen()),
                          );
                        },
                        child: Container(
                          width: _width * .3,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent.shade100,
                            border:
                                Border.all(color: Colors.deepPurple, width: 3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Rules",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
