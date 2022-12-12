import 'package:flutter/material.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('expense $index'),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 50,
    );
  }
}
