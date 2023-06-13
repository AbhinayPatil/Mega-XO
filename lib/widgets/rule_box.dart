import 'dart:math';

import 'package:flutter/material.dart';

class RuleBox extends StatelessWidget {
  String rule;
  List<String> images;

  RuleBox({super.key, required this.rule, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          rule,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        if (images.isNotEmpty) ...[
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      height: 175,
                      width: min(350, MediaQuery.of(context).size.width * .8),
                      child: Image.asset("assets/${images[position]}"),
                    ),
                  ),
                );
              },
            ),
          )
        ],
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 3,
        ),
      ],
    );
  }
}
