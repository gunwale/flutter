import 'package:demo/business/component/transaction/transaction_repository.dart';
import 'package:flutter/material.dart';

import 'transaction_detail.dart';
import 'transaction_entity.dart';

class Transactions with ChangeNotifier {
  final Future<TransactionRepository> _transactionRepository =
      TransactionRepository.instance;

  final List<TransactionDetail> _transactionList = new List();

  Future<List<TransactionDetail>> retrieve() async {
    return (await (await _transactionRepository).findAll())
        .map((transactionEntity) =>
            TransactionDetail(name: transactionEntity.name))
        .toList();
  }

  void create(TransactionDetail transactionDetail) async {
    (await _transactionRepository)
        .persist(TransactionEntity(id: null, name: transactionDetail.name));

    notifyListeners();

    (await (await _transactionRepository).findAll())
        .forEach((transactionEntity) => print(transactionEntity.id));
  }
}
