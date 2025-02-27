import 'package:flutter/material.dart';
import 'package:bulb_plugin/bulb_plugin.dart'; // Import your plugin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bulb Plugin Example',
      home: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BulbView(
          bulbSize: 200,
          colors: [Colors.yellow, Colors.blueGrey, Colors.teal, Colors.pink],
        ),
      ),
    );
  }
}
