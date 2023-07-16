import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/widgets/plan_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: PlanCard(),
            ),
            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
