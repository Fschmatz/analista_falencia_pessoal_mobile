import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expense/new_expense.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({Key? key}) : super(key: key);

  @override
  _ExpenseListPageState createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('''
Bartender please, fill my glass for me
With the wine you gave Jesus that set him free
After three days in the ground''')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => NewExpense(),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black87,
          ),
        ));
  }
}
