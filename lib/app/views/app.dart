import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/router.dart';
import 'package:unicorn/app/widgets/app_bar_background.dart';
import 'package:unicorn/app/widgets/app_bar_contents.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        HomeRoute(),
        InvoiceRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(280),
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              toolbarHeight: 260,
              title: title(context),
              bottom: TabBar(
                controller: controller,
                tabs: [
                  tab("Home"),
                  tab("Invoice"),
                  tab("Profile"),
                ],
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(4),
              ),
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                background: CustomPaint(
                  painter: AppBarBackground(),
                  size: Size(MediaQuery.of(context).size.width,
                      (MediaQuery.of(context).size.width * 0.8305555555555556)),
                ),
              ),
            ),
          ),
          body: GestureDetector(
            child: Builder(
              builder: (context) {
                if (mounted) {
                  return child;
                }
                return Container();
              },
            ),
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                controller.animateTo(controller.index - 1);
              } else if (details.primaryVelocity! < 0) {
                controller.animateTo(controller.index + 1);
              }
            },
          ),
        );
      },
    );
  }
}