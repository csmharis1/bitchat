
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'chat_screen.dart';

class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});
  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  List<ScanResult> _devices = [];

  @override
  void initState() {
    super.initState();
    FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 4));
    FlutterBluePlus.instance.scanResults.listen((results) {
      setState(() {
        _devices = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nearby Devices")),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index].device;
          return ListTile(
            title: Text(device.name.isNotEmpty ? device.name : device.id.toString()),
            onTap: () async {
              await device.connect();
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => ChatScreen(device: device),
              ));
            },
          );
        },
      ),
    );
  }
}
