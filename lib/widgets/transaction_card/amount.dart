import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  const Amount({
    Key key,
    @required this.amount,
  }) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
          child: Text('\$${amount.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
