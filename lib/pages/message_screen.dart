import 'dart:ui';

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Screen')
      ),
      body: Center(
        child: Text('Message Screen', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}