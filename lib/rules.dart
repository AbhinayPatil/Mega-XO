import 'package:flutter/material.dart';
import 'package:xo_game/widgets/rule_box.dart';

class RulesScreen extends StatelessWidget {
  RulesScreen({super.key});
  String rule1 =
      "1.There are big grid of 3x3. Each bigger box has a smaller 3x3 grid in itself.";
  String rule2 =
      "2.Green outline shows the active box. Only smaller 3x3 grid of the respective acive box is accessible for playing.";
  String rule3 =
      "3.The active box for opponent depends on the play of current player. The active box for next turn(opponents turn) is selected with respect to selection of smaller box in smaller 3x3 grid by the current player.";
  String rule4 =
      "4.If current moves corresponds to a bigger box that is already full for next turn, then the opponent get access to the whole grid in next turn.";
  String rule5 =
      "5.When a smaller grid is won by a player, it is converted to a bigger symbol.";
  String rule6 = "6.Rules of a normal 3x3 xo are defined for the bigger boxes.";
  String rule7 = "7.The game can result in a win/loss or a draw.";
  String rule8 =
      "8.For the opening turn of the game, whole grid is accessible.";

  List<List<String>> imageCollection = [
    ["ruleone.jpg"],
    [],
    ["rulethreeone.jpg", "rulethreetwo.jpg"],
    ["rulefourone.jpg", "rulefourtwo.jpg"],
    ["rulefiveone.jpg", "rulefivetwo.jpg"],
    ["rulesix.jpg"],
    [],
    []
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 70, 119, 199),
            Color.fromARGB(255, 56, 89, 172),
            Color.fromARGB(255, 43, 59, 146),
            Color.fromARGB(255, 29, 29, 119),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Play",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.1,
                      ),
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "let's go                     ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "MEGA XO",
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Rules:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            RuleBox(rule: rule1, images: imageCollection[0]),
                            RuleBox(rule: rule2, images: imageCollection[1]),
                            RuleBox(rule: rule3, images: imageCollection[2]),
                            RuleBox(rule: rule4, images: imageCollection[3]),
                            RuleBox(rule: rule5, images: imageCollection[4]),
                            RuleBox(rule: rule6, images: imageCollection[5]),
                            RuleBox(rule: rule7, images: imageCollection[6]),
                            RuleBox(rule: rule8, images: imageCollection[7]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
