import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  @override
  _NewExpenseState createState() => _NewExpenseState();


  //Function() refreshHome;

  NewExpense({Key? key})
      : super(key: key);
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController controllerPersonName = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  late FocusNode inputFieldNode;
  bool validPersonName = true;
  bool validValue = true;

  @override
  void initState() {
    super.initState();
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
      validPersonName = false;
    }
    if (controllerValue.text.isEmpty) {
      ok = false;
      validValue = false;
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title:  const Text('New'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Save',
            onPressed: () {
              if (validateTextFields()) {

                //widget.refreshHome();
                Navigator.of(context).pop();
              } else {
                setState(() {
                  validPersonName;
                  validValue;
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
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
                  errorText: validPersonName ? null : "Name is empty"),
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
                  errorText: validValue ? null : "Value is empty"),
            ),
          ),

        ],
      ),
    );
  }
}
