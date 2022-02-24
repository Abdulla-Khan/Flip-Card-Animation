import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = false;

  FlipCardController _controller = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flip Card Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.s,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                child: Text(isOn ? 'Horizontal Flip' : 'Vertical Flip')),
            const SizedBox(
              height: 40,
            ),
            FlipCard(
                controller: _controller,
                direction:
                    isOn ? FlipDirection.HORIZONTAL : FlipDirection.VERTICAL,
                flipOnTouch: false,
                front: customCard("Frond Side"),
                back: customCard("Back Side")),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.toggleCard();
                },
                child: const Text("Flip Card"))
          ],
        ),
      ),
    );
  }
}

Widget customCard(String title) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(20),
    color: Colors.blue,
    child: Container(
      height: 450,
      width: 300,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
