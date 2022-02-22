import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime datePicked;

  void submitData() {
    if (amountInput.text.isEmpty) {
      return;
    }
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);
    final enteredDate = datePicked;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }
    widget.addTransaction(
      titleInput.text,
      double.parse(amountInput.text),
      datePicked,
    );

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        datePicked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return // Input Data Card
        Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(color: Colors.black12),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // Title of Spending
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                    controller: titleInput,
                    onSubmitted: (_) => submitData(),
                  ),
                  // Amount Spent
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Amount',
                    ),
                    controller: amountInput,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => submitData(),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 70,
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          datePicked == null
                              ? 'No Date Choosen'
                              : 'Date : ${DateFormat.yMd().format(datePicked)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: presentDatePicker,
                        child: Text('Choose Date'),
                      )
                    ]),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text('Add Transaction'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        elevation: 5,
                      ),
                      onPressed: submitData,
                    ),
                  ),
                ],
              ),
            ));
  }
}
