import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
   
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:const UTip(),
    );
  }
}
class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('UTip'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
         [
          Text("hi world")
         ],
      ),
    );
  }
}
