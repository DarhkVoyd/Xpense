import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
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
                  ),
                  // Amount Spent
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Amount',
                    ),
                    controller: amountInput,
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
                      onPressed: () {
                        addTransaction(
                          titleInput.text,
                          double.parse(amountInput.text),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
