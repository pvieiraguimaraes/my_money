import 'package:flutter/material.dart';
import 'package:my_money/models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(title: 'Flutter Demo Home Page', transactions: [
        Transaction(
            id: '1',
            title: 'New Shoes',
            amount: 123.45,
            date: DateTime(2022, 12, 16)),
        Transaction(
            id: '2',
            title: 'Car part',
            amount: 729.45,
            date: DateTime(2022, 12, 16))
      ]),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.transactions});

  final List<Transaction> transactions;
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text(
                  'Chart',
                ),
              ),
            ),
            Column(
                children: widget.transactions.map((e) {
              return Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Text(e.title),
                    Text(e.amount.toString()),
                    Text(e.date.toString())
                  ]));
            }).toList())
          ],
        ),
      ),
    );
  }
}
