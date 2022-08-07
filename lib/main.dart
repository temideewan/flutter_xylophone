import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<int> numbers = List.generate(7, (index) => index + 1);
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.indigo,
    Colors.amber,
    Colors.deepOrange,
  ];
  void playSound(int index) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$index.wav'));
  }

  @override
  Widget build(BuildContext context) {
    print(numbers);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: numbers
                  .map(
                    (e) => Expanded(
                      child: MaterialButton(
                        color: colors[e - 1],
                        textColor: Colors.white,
                        child: Text("Click me"),
                        onPressed: () {
                          playSound(e);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
