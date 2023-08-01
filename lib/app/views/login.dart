import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:unicorn/app/router/app_router.dart';
import 'package:unicorn/app/widgets/app_bar_background.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(354.h),
        child: ClipPath(
          clipper: WaveClipper(),
          child: AppBar(
            backgroundColor: Colors.blue,
            flexibleSpace: CustomPaint(
              painter: AppBarBackground(),
              size: Size(MediaQuery.of(context).size.width,
                  (MediaQuery.of(context).size.width)),
            ),
          ),
        ),
      ),
      body: ResponsiveScaledBox(
        width: 490.w,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            height: size.height,
            child: Align(
              alignment: Alignment(0.w, 0.9.h),
              child: Container(
                height: size.height * 0.67,
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 53.sp,
                                letterSpacing: 0.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Sign in to continue',
                            style: TextStyle(
                                fontSize: 18.sp,
                                wordSpacing: 0.5.sp,
                                color: Colors.black.withAlpha(238),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Form(
                      key: _formKey,
                      child: FormField(
                        builder: (field) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0)
                                    .copyWith(bottom: 12),
                                child: Container(
                                  // height: 76.h,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.alphaBlend(
                                        Colors.black.withOpacity(0.05),
                                        Colors.white),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 22.sp),
                                    decoration: InputDecoration(
                                        icon: const Icon(
                                            Icons.person_outline_rounded,
                                            size: 32,
                                            color: Colors.black),
                                        labelText: 'Username',
                                        labelStyle: TextStyle(
                                            fontSize: 23.sp,
                                            color: Colors.grey),
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.all(12)
                                            .copyWith(bottom: 18, top: 5),
                                        iconColor: Colors.grey),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(8.0).copyWith(top: 12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.alphaBlend(
                                        Colors.black.withOpacity(0.05),
                                        Colors.white),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 21.sp),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        icon: const Icon(
                                          Icons.lock_outline_rounded,
                                          size: 32,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            fontSize: 23.sp,
                                            color: Colors.grey),
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.all(12)
                                            .copyWith(bottom: 18, top: 5),
                                        iconColor: Colors.grey),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(8.0).copyWith(top: 23),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      backgroundColor:
                                          const Color.fromARGB(255, 7, 39, 87),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onPressed: () =>
                                        context.router.pushAndPopUntil(
                                          const InitialRoute(),
                                          predicate: (route) => false,
                                        ),
                                    child: SizedBox(
                                      width: size.width,
                                      height: size.height * 0.074,
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 29.sp),
                                        ),
                                      ),
                                    )),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(fontSize: 18.sp),
                                  ))
                            ],
                          );
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.9);
    path.lineTo(size.width * 0.07, size.height * 0.73);
    final p0 = Offset(size.width * 0.23, size.height * 0.43);
    final p1 = Offset(size.width * 0.56, size.height * 0.68);
    path.quadraticBezierTo(p0.dx, p0.dy, p1.dx, p1.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
