import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submitData() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(
      titleInput.text,
      double.parse(amountInput.text),
    );

    Navigator.of(context).pop();
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
                    margin: EdgeInsets.only(top: 15),
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
