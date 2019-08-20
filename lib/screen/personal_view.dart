import 'package:flutter/material.dart';

class PersonalView extends StatefulWidget {
  @override
  _PersonalViewState createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal"),
      ),
      backgroundColor: Colors.tealAccent,
      body: Text("Personal view"),
    );
  }
}