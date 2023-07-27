import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicorn/app/router/app_router.dart';
import 'package:unicorn/app/widgets/navigation_drawer.dart';
import 'package:unicorn/app/widgets/app_bar_contents.dart';
import 'package:unicorn/app/widgets/app_bar_background.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
  late TabController controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  IconData menuIcon = Icons.menu_outlined;

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
        final size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            toolbarHeight: 280,
            title: title(context),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(12),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_scaffoldKey.currentState!.isDrawerOpen) {
                            menuIcon = Icons.menu_outlined;
                            _scaffoldKey.currentState?.closeDrawer();
                          } else {
                            menuIcon = Icons.close;
                            _scaffoldKey.currentState?.openDrawer();
                          }
                        });
                      },
                      icon: Icon(
                        menuIcon,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: size.width * 0.85,
                    child: TabBar(
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
                  ),
                ],
              ),
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
          body: Scaffold(
            key: _scaffoldKey,
            drawer: const NavDrawer(),
            body: GestureDetector(child: Builder(
              builder: (context) {
                if (mounted) {
                  return child;
                }
                return Container();
              },
            ), onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                controller.animateTo(controller.index - 1);
              } else if (details.primaryVelocity! < 0) {
                controller.animateTo(controller.index + 1);
              }
            }),
          ),
        );
      },
    );
  }
}
