import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:money_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> tx;
  final Function removeitem;
  TransactionList(this.tx, this.removeitem);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 400,
      padding:  EdgeInsets.all(20),
      child: widget.tx.isEmpty ? Container(
        alignment: Alignment.topCenter,
        child: Text("---No Transactions---",
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontFamily: 'monospace',
          
          ),),
      ) :
      ListView(
        children: widget.tx.map((e) {
          return TransCard(e, widget.removeitem);
        }).toList(),
      ),
    );
  }
}

class TransCard extends StatelessWidget {
  final Transaction e;
  final Function removeitem;
  TransCard(this.e, this.removeitem);
  @override
  Widget build(BuildContext context) {
    return  Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                
                elevation: 5,
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Container(
            decoration: BoxDecoration(border: Border(left: BorderSide(width: 7))),
            
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: Row(
              
              children: [
                Container(
                 height: 40,
                 width: 80,
                 padding: EdgeInsets.all(6),
                  
                  
                  child: Center(
                    
                    child: FittedBox(
                      child: Text("\$"+ e.amount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white),
                      
                      ),
                    )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    border: Border.all(
                      width: 1, color: Colors.black),
                    ),
                  ),
                SizedBox(width: 20),
                Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(e.title.toString()),
                    SizedBox(height: 10),
                    Text(DateFormat.yMMMEd().format(e.date))],
                  ),
                ),
                IconButton(onPressed: (){
                  removeitem(e);                  
                },
                
                 icon: Icon(Icons.delete))
              ],
            ),
          ),
    ));
  }
}
