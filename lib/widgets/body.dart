import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'chart/chart.dart';
import 'transaction_list.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required List<Transaction> recentTransactions,
    @required List<Transaction> transactions,
    @required Function deleteTx,
  })  : _recentTransactions = recentTransactions,
        _transactions = transactions,
        _deleteTx = deleteTx,
        super(key: key);

  final List<Transaction> _recentTransactions;
  final List<Transaction> _transactions;
  final Function _deleteTx;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_transactions, _deleteTx),
        ],
      ),
    );
  }
}
