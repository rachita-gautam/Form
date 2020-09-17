import 'package:flutter/material.dart';
import 'db_provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    DatabaseProvider.db.getField();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
