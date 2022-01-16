import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/models/transaction.dart';
import 'chartbar.dart';


class Chart extends StatelessWidget {
  final List<Transaction> recent;
  Chart(this.recent);

  List<Map> get ass{
    return List.generate(7, (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        double amount = 0;
        for(int i = 0; i < recent.length; i++){
          if(weekday.day == recent[i].date.day){
              amount += recent[i].amount;
          }
        }
        return {
          'day': DateFormat().add_E().format(DateTime.now().subtract(Duration(days: index))),
          'amount': amount};
    });
  }

  double get getTotalAmount{
    double total = 0;
    ass.forEach((element)
      {
        total += element['amount'];

    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          height: 140,
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...ass.map((e) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(day: e['day'], amount: e['amount'],
                totalAmount: getTotalAmount,
                ),
              )),
              // ChartBar(day: ass[0]['day'], amount: ass[0]['amount'], totalAmount: getTotalAmount,),
            ],
          ),
        ));
  }
}