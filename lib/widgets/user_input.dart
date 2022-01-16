import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInput extends StatefulWidget {
  final addTk;
  UserInput(this.addTk);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final nameController = TextEditingController();
  DateTime? mydate;
  final amountController = TextEditingController();
  void submitData(){
      final String name = nameController.text;
      final double ammount = double.parse(amountController.text);

      if(name.isEmpty || ammount <= 0){
        return;
      }
      else{
        widget.addTk(nameController.text, double.parse(amountController.text),
                    mydate);
      }
      Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Row(
          
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  TextField(
                   
                    controller: nameController,
                    decoration: InputDecoration(
                        label: Text(
                          'Name',
                        ),
                        
                        ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    
                    autofocus: false,
                    controller: amountController,
                    decoration: InputDecoration(
                        
                      label: Text(
                        "Amount",
                      ),
                      
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Text(mydate == null ? "No Date": DateFormat.yMEd().format(mydate!),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: (){
                         
                            showDatePicker(
                            builder: (context,child){
                              return Theme(
                                child: child!,
                                data: ThemeData().copyWith(
                                  
                                  dialogBackgroundColor: Colors.black,
                                  colorScheme: ColorScheme.dark(
                                    primary: Colors.white,
                                    secondary: Colors.black,
                                  )),
                              );
                            },
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime.utc(2020, 1, 1),
                            lastDate: DateTime.now()).then((value){
                               setState(() {
                                 mydate = value;
                               });
                            });
                          ;
                        },
                        child: Icon(Icons.date_range),
                        ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                submitData();
              },
              child: const Text("Submit"),
              style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
            ),
            
          ],
        ),
      ),
    );
  }
}
