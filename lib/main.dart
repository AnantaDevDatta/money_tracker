import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/chart.dart';
import 'package:money_tracker/widgets/transaction_list.dart';
import 'package:money_tracker/widgets/user_transaction.dart';
import 'package:money_tracker/widgets/user_input.dart';
import './models/transaction.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/chartbar.dart';




void main() {
  runApp(MA());
}

class MA extends StatefulWidget {
  const MA({ Key? key }) : super(key: key);

  @override
  _MAState createState() => _MAState();
}

class _MAState extends State<MA> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainApp(),debugShowCheckedModeBanner: false,);
  }
}


class MainApp extends StatefulWidget {


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  
  final List<Transaction> transactions = [
    Transaction(date: DateTime.now(), title: 'Fruits',amount: 123),
    Transaction(date: DateTime.utc(2022,1,4), amount: 300, title: 'So try')
  ]; 

  void addTx(String name, double num, DateTime date){
    setState(() {
        transactions.insert(0,Transaction(amount: num, title: name, date: date));
    });
  }

  void removeItem(e){
    setState(() {
       transactions.removeWhere((element) => element == e);
    });
  
  }

  void _startAtNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      
      context: ctx, builder: (ctx){
          return UserInput(addTx);
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                _startAtNewTransaction(context);
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.grey[700],
              ),
            appBar: AppBar(
              actions: [
              IconButton(
                        onPressed: ()   {
                        _startAtNewTransaction(context);
    }, icon: Icon(Icons.add)),
                 

              ],
              leading: Icon(Icons.paid),
              backgroundColor: Colors.black,
              title:  Text(
                "Ananta's Financial Book",
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Chart(transactions),
                  
                    
                      TransactionList(transactions, removeItem),
                    

                ],
              ),
              
            ),
    );
            
          
  
  }
}


