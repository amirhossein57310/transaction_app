import 'package:flutter/material.dart';
import 'package:transaction_app/model/tansaction.dart';
import 'package:transaction_app/widget/chart.dart';

import '../widget/new_transaction.dart';
import '../widget/transaction_list.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  bool _showChart = false;

  // String titleInput = '';

  List<Transaction> transaction = [
    // Transaction(
    //   id: '001',
    //   title: 'shoes',
    //   amount: 20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '002',
    //   title: 'coats',
    //   amount: 10,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '003',
    //   title: 'lamp',
    //   amount: 30,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addNewTransaction(String txTitle, double txAmount, DateTime pickedDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: pickedDate);
    setState(() {
      transaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    final _isLandScaped =
        MediaQuery.of(context).orientation == Orientation.landscape;
    AppBar _appBar = AppBar(
      title: Text('flutter app'),
      backgroundColor: Theme.of(context).disabledColor,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            _startAddNewTransaction(context);
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_isLandScaped)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'show chart',
                    style: TextStyle(fontSize: 17, fontFamily: 'osb'),
                  ),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (_isLandScaped)
              _showChart
                  ? SizedBox(
                      height: (_mq.size.height -
                              _appBar.preferredSize.height -
                              _mq.padding.top) *
                          0.8,
                      child: Chart(_recentTransaction),
                    )
                  : SizedBox(
                      height: (_mq.size.height -
                              _appBar.preferredSize.height -
                              _mq.padding.top) *
                          0.7,
                      child: TransactionLiist(
                        transaction: transaction,
                        removedTx: _deleteTransaction,
                      ),
                    ),
            if (!_isLandScaped)
              SizedBox(
                height: (_mq.size.height -
                        _appBar.preferredSize.height -
                        _mq.padding.top) *
                    0.3,
                child: Chart(_recentTransaction),
              ),
            if (!_isLandScaped)
              SizedBox(
                height: (_mq.size.height -
                        _appBar.preferredSize.height -
                        _mq.padding.top) *
                    0.7,
                child: TransactionLiist(
                  transaction: transaction,
                  removedTx: _deleteTransaction,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 5, 255, 234),
        onPressed: (() {
          _startAddNewTransaction(context);
        }),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _startAddNewTransaction(context) {
    showModalBottomSheet(
      context: context,
      builder: ((context) => NewTransaction(_addNewTransaction)),
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      transaction.removeWhere((tx) => tx.id == id);
    });
  }
}
