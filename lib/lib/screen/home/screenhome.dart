import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/model/category/category_model.dart';
import 'package:moneymanagement/screen/category/category_add_popup.dart';
import 'package:moneymanagement/screen/category/screencategory.dart';
import 'package:moneymanagement/screen/home/widgets/bottom_navigation.dart';
import 'package:moneymanagement/screen/transaction/screentransaction.dart';

final _pages = const [
  ScreenTransaction(),
  ScreenCategory(),
];

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 251, 251),
      appBar: AppBar(
        title: Text('MONEY MANAGER'),
        centerTitle: true,
        // toolbarHeight: 80,
        // shadowColor: Colors.purple,
        // elevation: 20,
      ),
      bottomNavigationBar: MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedindex, _) {
            return _pages[updatedindex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('add transaction details');
          } else if (selectedIndexNotifier.value == 1) {
            showCategoryAddPopup(context);
            // print('add categories details');
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'tra',
            //   type: CategoryType.expence,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
