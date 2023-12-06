import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(src),
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            const Text(
              "Find",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 100,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      )),
    );
  }
}
