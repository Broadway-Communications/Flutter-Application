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
            SizedBox(
              height: size.height * 0.18,
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
                      text: 'Wallet'),
                  IconCard(
                      size: size, icon: Icons.ramen_dining, text: 'Plan Info'),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 152.0,
                      height: 50.0,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.error_outline,
                            color: Colors.white),
                        label: const Text('Complaint',style: TextStyle(color: Colors.white)),
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F4C75)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 115.0,
                      height: 50.0,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.question_answer_outlined,color: Colors.white),
                        label: const Text('FAQ',style: TextStyle(color: Colors.white)),
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F4C75)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
