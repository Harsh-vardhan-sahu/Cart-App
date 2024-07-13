import 'package:flutter/material.dart';
class homepage extends StatelessWidget {
  const homepage({super.key});
 final days= 30;
 final name="Harshvardhan";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text("Catalog app"),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:  Container(
          child: Text("Welcome to $days days of flutter and i am $name"),
        //  color: Colors.red,
        ),
      ) ,
drawer: Drawer(
),
    );
  }
}
