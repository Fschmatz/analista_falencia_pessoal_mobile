import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../util/block_picker_alt.dart';

class NewCategory extends StatefulWidget {
  @override
  _NewCategoryState createState() => _NewCategoryState();

  const NewCategory({Key? key}) : super(key: key);
}

class _NewCategoryState extends State<NewCategory> {
  TextEditingController customControllerName = TextEditingController();
  Color pickerColor = const Color(0xFFe35b5b);
  Color currentColor = const Color(0xFFe35b5b);
  RxBool _validName = true.obs;

  /*Future<void> _saveTag() async {
    saveTag(Tag(
      null,
      customControllerName.text,
      currentColor.toString(),
    ));
  }*/

  bool validateTextFields() {
    if (customControllerName.text.isEmpty) {
      _validName.value = false;
      return false;
    }
    return true;
  }

  //COLORS
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  createAlertSelectColor(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text(
        "Ok",
      ),
      onPressed: () {
        setState(() => {currentColor = pickerColor});
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Select Color:",
      ),
      content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          )),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Save',
            icon: const Icon(
              Icons.save_outlined,
            ),
            onPressed: () async {
              if (validateTextFields()) {
               // _saveTag();
                Navigator.of(context).pop();
              }
            },
          )
        ],
        title: const Text('New Tag'),
      ),
      body: Obx(
              () =>
         ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                autofocus: true,
                minLines: 1,
                maxLength: 30,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: customControllerName,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    labelText: "Name",
                    counterText: "",
                    helperText: "* Required",
                    errorText: _validName.value ?  null : "Name is empty"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 16, 5),
              child: Text('Color',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.headline1!.color
                ),
              ),
            ),
            ListTile(
              title: OutlinedButton(
                  onPressed: () {
                    createAlertSelectColor(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 60),
                    elevation: 0,
                    primary: currentColor,
                    onPrimary: currentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const SizedBox.shrink()),
            ),
          ],
        ),
      ),
    );
  }
}
