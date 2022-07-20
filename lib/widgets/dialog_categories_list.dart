import 'package:flutter/material.dart';
import '../classes/category.dart';
import '../db/category_dao.dart';
import '../pages/category/edit_category.dart';
import '../pages/category/new_category.dart';
import '../util/utils_functions.dart';

class DialogCategoriesList extends StatefulWidget {
  const DialogCategoriesList({Key? key}) : super(key: key);

  @override
  _DialogCategoriesListState createState() => _DialogCategoriesListState();
}

class _DialogCategoriesListState extends State<DialogCategoriesList> {
  bool loadingCategories = true;
  final _categories = CategoryDao.instance;
  List<Map<String, dynamic>> _categoriesList = [];

  @override
  void initState() {
    super.initState();
   // getTags();
  }

  Future<void> _delete(int id_tag) async {
    final deleted = await _categories.delete(id_tag);
  }

  Future<void> getCategories() async {
    var resp = await _categories.queryAllRows();
    setState(() {
      _categoriesList = resp;
      loadingCategories = false;
    });
  }

  showAlertDialogOkDelete(BuildContext context, idTag) {
    Widget okButton = TextButton(
      child: Text(
        "Yes",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary),
      ),
      onPressed: () {
        _delete(idTag).then((value) => getCategories());
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: const Text(
        "Confirm", //
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "\nDelete ?",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
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
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.fromLTRB(16, 25, 0, 24),
      title: const Text('Categories'),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          child: const Text(
            "New Category",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NewCategory(),
                  fullscreenDialog: true,
                )).then((value) => getCategories());
          },
        ),
        TextButton(
          child: const Text(
            "Close",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
      content: SizedBox(
        height: 330.0,
        width: 350.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _categoriesList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
              leading: Icon(Icons.circle,
                  color: parseColorFromDb(_categoriesList[index]['color'])),
              title: Text(_categoriesList[index]['name']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _categoriesList.length > 1
                      ? IconButton(
                          icon: Icon(
                            Icons.delete_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .headline6!
                                .color!
                                .withOpacity(0.8),
                          ),
                          onPressed: () {
                            showAlertDialogOkDelete(
                                context, _categoriesList[index]['id_tag']);
                          })
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .headline6!
                            .color!
                            .withOpacity(0.8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => EditCategory(
                                tag: Category(
                                  _categoriesList[index]['idCategory'],
                                  _categoriesList[index]['name'],
                                  _categoriesList[index]['color'],
                                ),
                              ),
                              fullscreenDialog: true,
                            )).then((value) => getCategories());
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
