import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicorn/app/widgets/plan_card.dart';

final plans = [
  {
    'title': 'Blazing Speed',
    'speed': '75 Mbps Unlimited',
    'validity': '6 Months',
    'bill': '658',
    'isExpired': false,
  },
  {
    'title': 'Blazing Speed',
    'speed': '75 Mbps Unlimited',
    'validity': '6 Months',
    'bill': '658',
    'isExpired': true,
  },
  {
    'title': 'Blazing Speed',
    'speed': '75 Mbps Unlimited',
    'validity': '6 Months',
    'bill': '658',
    'isExpired': true,
  },
  {
    'title': 'Blazing Speed',
    'speed': '75 Mbps Unlimited',
    'validity': '6 Months',
    'bill': '658',
    'isExpired': true,
  }
  // You can add more plans here...
];

@RoutePage()
class InvoiceHistoryPage extends StatelessWidget {
  const InvoiceHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),
            colors: [Color(0xff001422), Color(0xff3D579D)],
            stops: [0, 1],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: const Text(
                    'Invoice History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: plans.isEmpty
                      ? const Center(
                          child: Text(
                            "Your invoice history will appear here.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: plans.map<Widget>((plan) {
                              return PlanCard(
                                title: plan['title'] as String,
                                speed: plan['speed'] as String,
                                validity: plan['validity'] as String,
                                bill: plan['bill'] as String,
                                isExpired: plan['isExpired'] as bool,
                              );
                            }).toList(),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
