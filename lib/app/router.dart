import 'package:auto_route/auto_route.dart';
import 'package:unicorn/app/views/hompage.dart';
import 'package:unicorn/app/views/invoice_page.dart';
import 'package:unicorn/app/views/profile_page.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: HomeRoute.page, path: '/homePage',initial: true),AutoRoute(page: InvoiceRoute.page,path: '/invoicePage')];
}
