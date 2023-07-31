import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/views/home_page.dart';
import 'package:unicorn/app/views/invoice_page.dart';
import 'package:unicorn/app/views/profile_page.dart';
import 'package:unicorn/app/views/app.dart';
import 'package:unicorn/app/views/login.dart';
import 'package:unicorn/app/views/complaint_history_page.dart';
import 'package:unicorn/app/views/splash_screen.dart';
import 'package:unicorn/app/views/invoice_history_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  static List<AutoRoute>? route;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/', initial: true),
        CustomRoute(
          page: LoginRoute.page,
          path: '/loginPage',
          initial: false,
          durationInMilliseconds: 700,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                  Tween(begin: const Offset(0, 1), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeIn))),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: InitialRoute.page,
          path: '/mainPage',
          children: [
            AutoRoute(page: HomeRoute.page, path: 'homePage'),
            AutoRoute(page: InvoiceRoute.page, path: 'invoicePage'),
            AutoRoute(page: ProfileRoute.page, path: 'profilePage'),
          ],
          durationInMilliseconds: 400,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                  Tween(begin: const Offset(1.5, 0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.bounceIn))),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: ComplaintHistoryRoute.page,
          path: '/complaintHistoryPage',
          initial: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                  Tween(begin: const Offset(0, 1), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: InvoiceHistoryRoute.page,
          path: '/invoiceHistoryPage',
          initial: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                  Tween(begin: const Offset(0, 1), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
          },
        )
      ];
}
