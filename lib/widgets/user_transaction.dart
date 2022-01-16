// import 'package:flutter/material.dart';
// import 'package:money_tracker/models/transaction.dart';
// import 'package:money_tracker/widgets/transaction_list.dart';
// import 'package:money_tracker/widgets/user_input.dart';

// class UserTransaction extends StatefulWidget {

//   @override
//   _UserTransactionState createState() => _UserTransactionState();
// }

// class _UserTransactionState extends State<UserTransaction> {

//   final List<Transaction> transactions = []; 

//   void addTx(String name, double num, DateTime date){
//     setState(() {
//         transactions.add(Transaction(amount: num, title: name, date: date));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         UserInput(addTx),
//         const SizedBox(height: 30),
//         TransactionList(transactions),
//       ],
//     );
//   }
// }