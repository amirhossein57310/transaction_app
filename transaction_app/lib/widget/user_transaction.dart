import 'package:flutter/material.dart';
import '../model/tansaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: '001',
      title: 'shoes',
      amount: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '002',
      title: 'coats',
      amount: 10,
      date: DateTime.now(),
    ),
    Transaction(
      id: '003',
      title: 'lamp',
      amount: 30,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
