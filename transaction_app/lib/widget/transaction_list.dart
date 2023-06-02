import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../model/tansaction.dart';

class TransactionLiist extends StatelessWidget {
  TransactionLiist(
      {Key? key, required this.transaction, required this.removedTx})
      : super(key: key);

  final List<Transaction> transaction;
  Function removedTx;

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Center(
            child: Column(
              children: const [
                Text(
                  'There is no transaction',
                  style: TextStyle(
                    fontFamily: 'qsb',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Image.asset(
                //   'images/item6.png',
                // ),
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              return _TransactionItem(
                  transaction: transaction[index], removedTx: removedTx);
            },
          ));
  }
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({
    Key? key,
    required this.transaction,
    required this.removedTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function removedTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          radius: 35,
          child: FittedBox(
            child: Text(
              '\$${transaction.amount}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMM().format(transaction.date),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () {
                  removedTx(transaction.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(fontFamily: 'osb', fontSize: 16),
                ),
              )
            : IconButton(
                onPressed: (() {
                  removedTx(transaction.id);
                }),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              ),
      ),
      // child: Row(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       margin: EdgeInsets.symmetric(
      //         vertical: 10,
      //         horizontal: 15,
      //       ),
      //       decoration: BoxDecoration(
      //           border: Border.all(
      //         width: 3,
      //         color: Colors.purple,
      //       )),
      //       child: Text(
      //         '\$${transaction[index].amount.toStringAsFixed(2)}',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           transaction[index].title,
      //           style: TextStyle(
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         Text(
      //           DateFormat.yMMM().format(transaction[index].date),
      //           style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.grey,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
