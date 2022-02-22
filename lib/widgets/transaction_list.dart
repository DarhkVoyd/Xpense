import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                    margin: EdgeInsets.all(30),
                    height: 150,
                    child: Image.asset('assests/images/waiting.png',
                        fit: BoxFit.cover)),
                Text('No transactions added yet.'),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(1),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              '\u{20B9}${transactions[index].amount}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'QuickSand',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat('dd.MMM.yyyy hh:mm aaa')
                            .format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
