import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/widgets/icon_card.dart';
import 'package:unicorn/app/widgets/plan_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: PlanCard(),
            ),
            Container(
              height: size.height *
                  0.18, // Set a fixed height or provide constraints
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                shrinkWrap: true,
                children: [
                  IconCard(
                      size: size, icon: Icons.sim_card, text: 'Change Plan'),
                  IconCard(
                      size: size,
                      icon: Icons.account_balance_wallet,
                      text: 'Change Plan'),
                  IconCard(
                      size: size,
                      icon: Icons.ramen_dining,
                      text: 'Change Plan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
