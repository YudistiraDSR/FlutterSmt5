import 'package:belajar_flutter/ui/product_form.dart';
import 'package:belajar_flutter/ui/product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Pertama',
      // home: ProductForm(),
      home: ProductPage(),
    );
  }
}
