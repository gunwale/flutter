import 'package:demo/business/component/transaction/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './history_item.dart';
import '../../../business/component/transaction/transactions.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<Transactions>(context);
    return Container(
      child: Center(
          child: FutureBuilder<List<TransactionDetail>>(
              future: transactions.retrieve(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TransactionDetail> transactionDetailList = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: transactionDetailList
                        .map((transactionDetail) => HistoryItem(
                            (HistoryItemModel(title: transactionDetail.name))))
                        .toList(),
                  );
                }
                return new CircularProgressIndicator();
              })),
    );
  }
}
