import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/model/tansaction.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(
    this.addTX, {
    Key? key,
  }) : super(key: key);

  Function addTX;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  var _selectedDate;

  void inputData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTX(enteredTitle, enteredAmount, _selectedDate);
    Navigator.pop(context);
  }

  void _bringUpDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              right: 10,
              left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (value) => inputData(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // onChanged: (value) {
                //   titleInput = value;
                // },
                decoration: InputDecoration(
                  labelText: 'Title : ',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (value) => inputData(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // onChanged: (value) {
                //   amountInput = value;
                // },
                decoration: InputDecoration(
                  labelText: 'amount : ',
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 80,
                child: Row(
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'no date '
                          : 'picked data: ${DateFormat().add_yMd().format(_selectedDate)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'osb',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: _bringUpDatePicker,
                      child: Text('pick data '),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent),
                onPressed: () {
                  // print(titleInput);
                  // print(amountInput);
                  // widget.addTX(
                  //     titleController.text, double.parse(amountController.text));
                },
                child: Text(
                  'add transaction',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
