import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicorn/app/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: (context, router) => ResponsiveBreakpoints.builder(
        child: router!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: 'MOBILE'),
          const Breakpoint(start: 451, end: 800, name: 'TABLET'),
          const Breakpoint(start: 801, end: 1200, name: 'DESKTOP'),
          const Breakpoint(start: 1201, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
