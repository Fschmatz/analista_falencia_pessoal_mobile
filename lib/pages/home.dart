import 'package:analista_falencia_pessoal/pages/expense_list_page.dart';
import 'package:analista_falencia_pessoal/pages/statistics_page.dart';
import 'package:flutter/material.dart';

import '../widgets/dialog_categories_list.dart';
import 'configs/settings_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTabIndex = 0;
  List<Widget> _tabs = [];


  @override
  void initState() {
    super.initState();
    appStartFunctions();
  }

  void appStartFunctions() async {
    _tabs = [
      ExpenseListPage(
        key: UniqueKey(),
      ),
      StatisticsPage(
        key: UniqueKey(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analista de Falência Pessoal'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.local_offer_outlined,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const DialogCategoriesList();
                    });
              }),
          const SizedBox(width: 8,),
          IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage(),
                      fullscreenDialog: true,
                    ));
              }),
        ],
      ),
      body:  _tabs[_currentTabIndex],
      floatingActionButton: _currentTabIndex == 0 ? FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        onPressed: () {

        },
        child: const Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ) : null,

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.payments_outlined),
            selectedIcon: Icon(
              Icons.payments,
              color: Colors.black87,
            ),
            label: 'Month Expenses',
          ),
          NavigationDestination(
            icon: Icon(Icons.assessment_outlined),
            selectedIcon: Icon(
              Icons.assessment,
              color: Colors.black87,
            ),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
