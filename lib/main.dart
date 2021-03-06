// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      home: MyHomePage(),
      theme: ThemeData(fontFamily: 'QuickSand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 79.99,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 16.69,
    //   date: DateTime.now().subtract(Duration(days: 2)),
    // ),
  ];

  void newTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(newTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transaction> get recentTransactions {
    return transactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        centerTitle: true,
        title: Text('Xpense'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Chart(recentTransactions),
              width: double.infinity,
            ),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
