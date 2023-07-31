import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:unicorn/app/router/app_router.dart';
import 'package:unicorn/app/widgets/plan_card.dart';

@RoutePage()
class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: PlanCard(
            title: 'Blazing Speed',
            speed: '75 Mbps Unlimited',
            validity: '6 Months',
            bill: '658',
            isExpired: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey.withAlpha(65);
                  } else {
                    return const Color(0xFF0F4C75);
                  }
                },
              ),
            ),
            child: const Text(
              'View Previous',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
