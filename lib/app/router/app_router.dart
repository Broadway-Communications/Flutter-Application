import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/views/home_page.dart';
import 'package:unicorn/app/views/invoice_page.dart';
import 'package:unicorn/app/views/profile_page.dart';
import 'package:unicorn/app/views/app.dart';
import 'package:unicorn/app/views/complaint_history_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  static List<AutoRoute>? route;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, path: '/', initial: true, children: [
          AutoRoute(page: HomeRoute.page, path: 'homePage'),
          AutoRoute(page: InvoiceRoute.page, path: 'invoicePage'),
          AutoRoute(page: ProfileRoute.page, path: 'profilePage'),
        ]),
        CustomRoute(
          page: ComplaintHistoryRoute.page,
          path: '/complaintHistoryPage',
          initial: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                  Tween(begin: Offset(0, 1), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
          },
        )
      ];
}
