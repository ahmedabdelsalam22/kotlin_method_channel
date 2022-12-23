import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'method_channel/native_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Method Channel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NativeCode(),
    );
  }
}
