import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

import './models/transaction.dart';
import './utils/theme.dart';
import './widgets/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      home: MyHomePage(),
      theme: myTheme(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _txs = [];

  List<Transaction> get _recentTxs {
    return _txs
        .where(
          (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))),
        )
        .toList();
  }

  void _addNewTx(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _txs.add(newTx);
    });
  }

  void _deleteTx(String id) {
    setState(() {
      _txs.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewTransaction(_addNewTx),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTx(context),
          ),
        ],
      ),
      body: Body(
        recentTransactions: _recentTxs,
        transactions: _txs,
        deleteTx: _deleteTx,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTx(context),
      ),
    );
  }
}
