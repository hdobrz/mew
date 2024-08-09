import 'package:flutter/material.dart';

class ClinicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العيادات'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text('صفحة العيادات'),
      ),
    );
  }
}
