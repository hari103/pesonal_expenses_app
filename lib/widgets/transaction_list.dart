import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'empty_list.dart';
import 'transaction_card/transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? EmptyList()
        : ListView.builder(
            itemBuilder: (ctx, index) =>
                TxCard(transaction: transactions[index], deleteTx: deleteTx),
            itemCount: transactions.length,
          );
  }
}
