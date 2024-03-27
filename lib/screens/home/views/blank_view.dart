import 'package:flutter/material.dart';

class MyBlankView extends StatefulWidget {
  const MyBlankView({super.key});

  @override
  State<MyBlankView> createState() => _MyBlankViewState();
}

class _MyBlankViewState extends State<MyBlankView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Hello world")),
    );
  }
}
