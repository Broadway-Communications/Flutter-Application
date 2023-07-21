import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/widgets/plan_card.dart';

@RoutePage()
class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PlanCard(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF0F4C75),
                    ),
                  ),
                  child: const Text(
                    'View Previous',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
