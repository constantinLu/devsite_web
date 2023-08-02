import 'package:flutter/material.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/gif/logo_gif_transparent.gif",
          height: 500.0,
          width: 500.0,
        ),
        Center(
          child: Text(
            "DEVSITE TITLE SECTION\n The Short animation logo, And some catchy short story",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
