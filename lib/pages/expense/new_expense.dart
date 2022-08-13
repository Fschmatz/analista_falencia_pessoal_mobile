import 'package:analista_falencia_pessoal/db/category_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NewExpense extends StatefulWidget {
  @override
  _NewExpenseState createState() => _NewExpenseState();

  //Function() refreshHome;

  NewExpense({Key? key}) : super(key: key);
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController controllerPersonName = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  late FocusNode inputFieldNode;
  RxBool validPersonName = true.obs;
  RxBool validValue = true.obs;
  RxList categoriesList = [].obs;
  RxBool loadingCategories = true.obs;

  @override
  void initState() {
    getCategoriesList();
    super.initState();
  }

  Future<void> getCategoriesList() async {
    final db = CategoryDao.instance;
    var resp = await db.queryAllRowsByName();
    categoriesList.value = resp;
    loadingCategories.value = false;
  }

  /*Future<void> saveCashflow() async {
    save(Cashflow(
      personName: controllerPersonName.text,
      type: widget.type!,
      value: double.parse(controllerValue.text),
      note: controllerNote.text,
    ));
  }

  Future<void> updateCashflow() async {
    update(Cashflow(
      id: widget.cashflow!.id,
      personName: controllerPersonName.text,
      type: widget.cashflow!.type,
      value: double.parse(controllerValue.text),
      note: controllerNote.text,
    ));
  }*/

  bool validateTextFields() {
    bool ok = true;
    if (controllerPersonName.text.isEmpty) {
      ok = false;
      validPersonName.value = false;
    }
    if (controllerValue.text.isEmpty) {
      ok = false;
      validValue.value = false;
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Expense'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Save',
            onPressed: () {
              if (validateTextFields()) {
                //widget.refreshHome();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Obx(
              () =>
         ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: TextField(
                autofocus: true,
                minLines: 1,
                maxLines: 3,
                maxLength: 200,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name,
                controller: controllerPersonName,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    helperText: "* Required",
                    labelText: "Name",
                    errorText: validPersonName.value ? null : "Name is empty"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                minLines: 1,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onEditingComplete: () => node.nextFocus(),
                controller: controllerValue,
                decoration: InputDecoration(
                    labelText: "Value",
                    helperText: "* Required",
                    errorText: validValue.value ? null : "Value is empty"),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 25, 0),
              child: Text(
                "Category",
                style:
                    TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
              ),
            ),
            (categoriesList.isEmpty)
                ? const SizedBox.shrink()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Wrap(
                      spacing: 8.0,
                      children: List<Widget>.generate( //categoriesList.length
                          5, (int index) {
                        return FilterChip(
                          key: UniqueKey(),
                          selected: false,
                          onSelected: (bool selected) {
                            // if (selectedTags
                            //     .contains(tagsList[index]['id_tag'])) {
                            //   selectedTags.remove(tagsList[index]['id_tag']);
                            // } else {
                            //   selectedTags.add(tagsList[index]['id_tag']);
                            // }
                            // setState(() {});
                          },
                          /*shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: selectedTags
                                .contains(tagsList[index]['id_tag'])
                                ? tagTextBrightness == Brightness.dark
                                ? darkenColor(
                                Theme.of(context)
                                    .colorScheme
                                    .primary,
                                65)
                                : lightenColor(
                                Theme.of(context)
                                    .colorScheme
                                    .primary,
                                70)
                                : Theme.of(context)
                                .inputDecorationTheme
                                .border!
                                .borderSide
                                .color
                                .withOpacity(0.3))),*/
                          label: Text(
                            'category[name]',
                          ),
                          /*backgroundColor: selectedTags
                        .contains(tagsList[index]['id_tag'])
                        ? tagTextBrightness == Brightness.dark
                        ? darkenColor(
                        Theme.of(context).colorScheme.primary,
                        65)
                        : lightenColor(
                        Theme.of(context).colorScheme.primary,
                        70)
                        : Theme.of(context).scaffoldBackgroundColor,
                    labelStyle: TextStyle(
                        color: selectedTags
                            .contains(tagsList[index]['id_tag'])
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                            .textTheme
                            .headline6!
                            .color!
                            .withOpacity(0.9)),*/
                        );
                      }).toList(),
                    ),
                  ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
