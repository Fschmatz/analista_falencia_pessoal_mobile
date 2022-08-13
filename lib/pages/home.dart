import 'package:analista_falencia_pessoal/pages/category/categories_manager.dart';
import 'package:analista_falencia_pessoal/pages/expense_list_page.dart';
import 'package:analista_falencia_pessoal/pages/history_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_navigation_controller.dart';
import '../widgets/dialog_categories_list.dart';
import 'configs/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    ExpenseListPage(
      key: UniqueKey(),
    ),
    HistoryPage(
      key: UniqueKey(),
    ),
  ];
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  void initState() {
    super.initState();
    // appStartFunctions();
  }

  void appStartFunctions() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Analista de Falência Pessoal'),
              pinned: false,
              floating: true,
              snap: true,
              actions: [
                Theme(
                  data: Theme.of(context).copyWith(useMaterial3: false),
                  child: PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert_outlined),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                            const PopupMenuItem<int>(
                                value: 0, child: Text('Categories')),
                            const PopupMenuItem<int>(
                                value: 1, child: Text('Settings')),
                          ],
                      onSelected: (int value) {
                        if (value == 0) {
                          Get.to(() => CategoriesManager());
                        } else if (value == 1) {
                          Get.to(() => Settings());
                        }
                      }),
                )
              ],
            ),
          ];
        },
        body: Obx(
          () => PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: _tabs[bottomNavigationController.currentIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: bottomNavigationController.currentIndex.value,
          onDestinationSelected: (index) {
            bottomNavigationController.changeIndex(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.payments_outlined),
              selectedIcon: Icon(
                Icons.payments,
              ),
              label: 'Month Expenses',
            ),
            NavigationDestination(
              icon: Icon(Icons.history_outlined),
              selectedIcon: Icon(
                Icons.history,
              ),
              label: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
