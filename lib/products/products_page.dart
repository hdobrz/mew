import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المنتجات'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text('صفحة المنتجات'),
      ),
    );
  }
}
