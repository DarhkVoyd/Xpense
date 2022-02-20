// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        centerTitle: true,
        title: Text('Xpense'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                child: Text(
                  'Chart',
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
                height: 200,
              ),
              elevation: 20,
              color: Colors.green,
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
