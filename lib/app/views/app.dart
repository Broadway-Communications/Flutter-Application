import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicorn/app/router.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
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
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Home",
                        style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                height: 1.0,
                                fontSize: 16.sp),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Invoice",
                        style:TextStyle(
                          color: Color(0xFFFFFFFF),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                height: 1.0,
                                fontSize: 16.sp
                                ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                height: 1.0,
                                fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(4),
              ),
              centerTitle: false,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/appbar.jpg'), fit: BoxFit.fill),
                ),
              ),
            ),
          ),
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
        );
      },
    );
  }

  Widget title(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(120)),
            ),
            child: ClipOval(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWxIwmVa8QmOHFoD75qJuEJh4O6dVc7-utA&usqp=CAU',
                height: 48,
                width: 48,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.93), 
                      fontSize: 48.sp,
                      fontFamily: 'Lato',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      height: 0.3333,
                      ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: Image.network(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                        height: 20,
                        width: 20,
                      ).image,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2,top:8),
              child: Text(
                "Ankush Hegde",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Lato',
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                    height: 0.8,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2,top:10),
              child: Text(
                "ankush@gmail.com",
                style:TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Lato',
                    fontStyle:FontStyle.normal,
                    letterSpacing: 0.5,
                    height: 1.0667,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2,top:10),
              child: Text(
                "123456789",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Lato',
                    ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
