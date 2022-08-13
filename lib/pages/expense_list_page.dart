import 'package:analista_falencia_pessoal/db/expense_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expense/new_expense.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({Key? key}) : super(key: key);

  @override
  _ExpenseListPageState createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {

  RxList expenseList = [].obs;
  RxBool loading = true.obs;

  @override
  void initState() {
    getCashflowList();
    super.initState();
  }

  Future<void> getCashflowList() async {
    final db = ExpenseDao.instance;
    var resp = await db.queryAllRows();
    expenseList.value = resp;
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
              () => (loading.value)
              ? const Center(child: SizedBox.shrink())
              : (expenseList.isEmpty)
              ? const Center(
              child: Text(
                "Nothing in here...\nGood!!!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
              : ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                ListView.builder(

                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: expenseList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: ListTile(
                        title: Text(expenseList[index]['name']),
                        subtitle: Text("\$ "+expenseList[index]['value'].toString() +" - " + expenseList[index]['date'] ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => NewExpense(),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ));
  }
}
