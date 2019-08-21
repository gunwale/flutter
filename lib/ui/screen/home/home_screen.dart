import '../../../business/component/transaction/transaction_detail.dart';
import '../../../business/component/transaction/transactions.dart';
import '../../../ui/component/history/history_feature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<Transactions>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[HistoryFeature()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            transactionProvider.create(TransactionDetail(name: 'One')),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
