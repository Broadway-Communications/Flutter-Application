import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class invoicePage extends StatefulWidget {
  const invoicePage({super.key});

  @override
  State<invoicePage> createState() => _invoicePageState();
}

class _invoicePageState extends State<invoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
