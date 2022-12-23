import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCode extends StatefulWidget {
  const NativeCode({Key? key}) : super(key: key);

  @override
  State<NativeCode> createState() => _NativeCodeState();
}

class _NativeCodeState extends State<NativeCode> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  _getBatteryLevel() {
    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {
        _batteryLevel = 'Battery level at $value % .';
      });
    }).catchError((onError) {
      setState(() {
        _batteryLevel = "Failed to get battery level: '${onError.message}'.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
