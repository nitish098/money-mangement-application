import 'package:flutter/material.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            elevation: 10,
            child: ListTile(
              leading: Text(
                '27 \n SEP',
                textAlign: TextAlign.center,
              ),
              title: Text('Rs 100000'),
              subtitle: Text('Travel'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: 25);
  }
}
