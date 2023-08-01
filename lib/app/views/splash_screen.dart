// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late double opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    delayedTransition();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    animation =
        Tween<double>(begin: 0, end: 180 * (3.14 / 180)).animate(controller);
    opacity = 0;

    controller.forward(from: 0);
  }

  Future<dynamic> delayedTransition() async {
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      opacity = opacity == 0 ? 1 : 0;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    context.router.pushAndPopUntil(const LoginRoute(),
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
        backgroundColor:
            Color.alphaBlend(Colors.black.withOpacity(0.5), Colors.blue),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF132948), Color(0xFF3D579D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
              child: Stack(
            children: [
              // AnimatedBuilder(
              //   builder: (context, child) {
              //     return Transform.rotate(
              //       angle: animation.value,
              //       child: Align(
              //         alignment: const Alignment(0, 0),
              //         child: Image.asset('assets/oroboros.jpg'),
              //       ),
              //     );
              //   },
              //   animation: animation,
              // ),
              Positioned(
                top: 20,
                bottom: 20,
                right: 20,
                left: 20,
                child: Align(
                  alignment: const Alignment(0, 0),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: opacity,
                    curve: Curves.ease,
                    child: Stack(
                      children: [
                        // Text(
                        //   "Broadway Communication",
                        //   textAlign: TextAlign.center,
                        //   style: GoogleFonts.fjallaOne(
                        //     fontSize: 40.sp,
                        //     letterSpacing: 2.sp,

                        //     foreground: Paint()
                        //       ..style = PaintingStyle.stroke
                        //       ..color = Colors.white
                        //       ..strokeWidth = 4,
                        //     // color: Color.alphaBlend(
                        //     //     Colors.black.withOpacity(0.05), Colors.blue),
                        //   ),
                        // ),
                        Text(
                          "Broadway\nCommunication",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lobsterTwo(
                            letterSpacing: 5.sp,
                            fontSize: 47.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
