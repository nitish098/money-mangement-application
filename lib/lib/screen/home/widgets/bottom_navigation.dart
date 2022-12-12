import 'package:flutter/material.dart';
import 'package:moneymanagement/screen/home/screenhome.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext context, int updatedindex, _) {
        return BottomNavigationBar(
            currentIndex: updatedindex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.blue,
            onTap: ((newindex) {
              ScreenHome.selectedIndexNotifier.value = newindex;
            }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Transaction'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'category')
            ]);
      },
    );
  }
}
