
import 'package:flutter/material.dart';
import 'screens/device_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Chat',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DeviceListScreen(),
    );
  }
}
