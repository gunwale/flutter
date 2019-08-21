import './history_list.dart';
import 'package:flutter/material.dart';

class HistoryFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[HistoryList()],
      ),
    );
  }
}
