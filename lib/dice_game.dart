import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  @override
  final DiceImage = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png'
  ];

  var leftDiceIndex = 0;
  var rightDiceIndex = 0;

  dynamic leftDiceNumber = 0;
  dynamic rightDiceNumber = 0;

  dynamic total = 0;

  dynamic highScore = 0;

  bool gameOver = false;

  bool playAgain = false;

  final random = Random.secure();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Game',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Container(
              child: Center(
                child: Text(
                  'SCORE $total',
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'HIGH SCORE $highScore',
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(DiceImage[leftDiceIndex],
                          width: 100.0, height: 100.0),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(DiceImage[rightDiceIndex],
                          width: 100.0, height: 100.0),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            if (!gameOver)
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: _rollTheDice,
                  child: Text('Roll'),
                ),
              ),
            ),
            SizedBox(height: 60.0),
            if (gameOver)
              Container(
                child: Center(
                  child: Text(
                    'GAME OVER',
                    style: TextStyle(fontSize: 26.0),
                  ),
                ),
              ),
            if(playAgain)
              Container(
                child: Center(
                  child: ElevatedButton(
                    onPressed: _playAgain,
                    child: Text('Play Again'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      leftDiceIndex = random.nextInt(6);
      leftDiceNumber += leftDiceIndex + 1;
      rightDiceIndex = random.nextInt(6);
      rightDiceNumber += rightDiceIndex + 1;
      total = leftDiceNumber + rightDiceNumber;

      if (total >= 50) {
        setState(() {
          gameOver = true;
          playAgain = true;
          leftDiceNumber = 0;
          rightDiceNumber = 0;
          if(total > highScore){
            highScore = total;
          }
        });
      }
    });


  }
  void _playAgain() {
    setState(() {
      playAgain = false;
      gameOver = false;
      leftDiceNumber = 0;
      rightDiceNumber = 0;
      total = 0;
    });
  }
}

