import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final HistoryItemModel transactionItemModel;

  HistoryItem(this.transactionItemModel);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(transactionItemModel.title),
        )
      ],
    ));
  }
}

class HistoryItemModel {
  String title;

  HistoryItemModel({this.title});
}
