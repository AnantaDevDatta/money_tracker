import 'package:flutter/material.dart';
import 'package:money_tracker/models/transaction.dart';

class ChartBar extends StatelessWidget {
  double? totalAmount;
  double? amount;
  String? day ;
  ChartBar({this.day, this.amount, this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return  Column(
        
        children: [
          FittedBox(child: Text("\$${amount}", style: TextStyle(fontSize: 10),)),
          SizedBox(height:5),
          Container(
            height: 60,
            width: 6,
            child: Stack(children: [
              Container(
                
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: totalAmount == 0 ? 0.0 : amount!/totalAmount!,
                  
                  child: Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 1),
                
                      ),
                  ),
                  
                ),
              ),
    
            ],),
        ),
        SizedBox(height: 5),
        Text(day!),
          ],
    
    
    );
  }
}