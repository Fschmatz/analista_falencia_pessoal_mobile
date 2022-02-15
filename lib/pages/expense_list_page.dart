import 'package:flutter/material.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({Key? key}) : super(key: key);

  @override
  _ExpenseListPageState createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('''
Bartender please, fill my glass for me
With the wine you gave Jesus that set him free
After three days in the ground'''));
  }
}
