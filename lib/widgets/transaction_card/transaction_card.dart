import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/models/transaction.dart';
import 'amount.dart';

class TxCard extends StatelessWidget {
  const TxCard({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: Amount(amount: transaction.amount),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTx(transaction.id),
        ),
      ),
    );
  }
}
