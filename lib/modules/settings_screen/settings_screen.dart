import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text('Settings Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
  }
}
