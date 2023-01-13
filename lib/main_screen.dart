import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/game_provider.dart';
import 'package:xo_game/widgets/info_box.dart';
import 'package:xo_game/widgets/play_area.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 70, 119, 199),
            Color.fromARGB(255, 56, 89, 172),
            Color.fromARGB(255, 43, 59, 146),
            Color.fromARGB(255, 29, 29, 119),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: (_height > _width)
              ? SafeArea(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        SizedBox(
                          width: _width,
                          height: _height - _width * 1.1,
                          child: InfoBox(),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 2, 1, 62),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const PlayArea(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SafeArea(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        SizedBox(
                          width: _width - _height * 1.1,
                          height: _height,
                          child: InfoBox(),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 2, 1, 62),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const PlayArea(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
