import 'package:flutter/material.dart';
import 'package:moneymanagement/model/category/category_model.dart';

ValueNotifier<CategoryType> selectCategoryNotifier =
    ValueNotifier(CategoryType.expence);

Future<void> showCategoryAddPopup(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text("Add Category"),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "add category",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  RadioButton(title: "income", type: CategoryType.income),
                  // Text("Income"),
                  RadioButton(title: "expense", type: CategoryType.expence),
                  // Text("Expense"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(onPressed: () {}, child: Text("ADD")),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({super.key, required this.title, required this.type});
  // const RadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectCategoryNotifier,
          builder: (BuildContext context, CategoryType newCategory, child) {
            return Radio<CategoryType>(
                value: type,
                groupValue: selectCategoryNotifier.value,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  selectCategoryNotifier.value = value;
                  selectCategoryNotifier.notifyListeners();
                });
          },
        ),
        Text(title),
      ],
    );
  }
}
