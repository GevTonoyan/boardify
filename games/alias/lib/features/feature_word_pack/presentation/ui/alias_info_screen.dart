import 'package:flutter/material.dart';

class AliasInfoScreen extends StatelessWidget {
  const AliasInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alias Info'),
      ),
      body: Center(
        child: Text('Alias information will be displayed here.'),
      ),
    );
  }
}
