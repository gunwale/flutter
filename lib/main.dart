import 'package:demo/business/component/transaction/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business/component/transaction/transactions.dart';
import 'ui/screen/home/home_screen.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Transactions>(
        builder: (_) => Transactions(),
        child: HomeScreen(),
      ),
    );
  }
}
