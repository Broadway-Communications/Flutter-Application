import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicorn/app/router/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animation =
        Tween<double>(begin: 0, end: 90 * (3.14 / 180)).animate(controller);
    controller.forward(from: 0);
    delayedTransition();
  }

  Future<dynamic> delayedTransition() async {
    await Future.delayed(Duration(milliseconds: 700));
    context.router.pushAndPopUntil(LoginRoute(),
        predicate: (Route<dynamic> route) => true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Stack(
          children: [
            AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: Align(
                    alignment: const Alignment(0, 0),
                    child: Image.asset('assets/oroboros.jpg'),
                  ),
                );
              },
              animation: animation,
            ),
            Positioned(
              top: 20,
              bottom: 20,
              right: 20,
              left: 20,
              child: Align(
                alignment: Alignment(0, 0),
                child: AnimatedCrossFade(
                  firstChild: const SizedBox(),
                  secondChild: Text(
                    "Broadway Communication",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.blue,
                    ),
                  ),
                  duration: Duration(milliseconds: 650),
                  crossFadeState: CrossFadeState.showSecond,
                ),
              ),
            ),
          ],
        )));
  }
}
