import 'package:flutter/material.dart';

import 'demo/ds_demo_page.dart';
import 'design_system/ds.dart';

void main() {
  runApp(const DSApp());
}

class DSApp extends StatefulWidget {
  const DSApp({super.key});

  @override
  State<DSApp> createState() => _DSAppState();
}

class _DSAppState extends State<DSApp> {
  DSBrand _brand = DSBrand.more;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DS Handz',
      theme: DSThemeData.light(_brand),
      home: DSDemoPage(
        brand: _brand,
        onBrandChanged: (value) {
          setState(() {
            _brand = value;
          });
        },
      ),
    );
  }
}
