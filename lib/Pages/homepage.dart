import 'package:flutter/material.dart';
import 'package:flutternew/models/catalog.dart';
import "package:flutternew/widgets/drawer.dart";
import 'package:flutternew/widgets/item_widget.dart';

import '../models/catalog.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';

class homepage extends StatelessWidget {
  final int days = 30;
  final String name = "Harshvardhan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the drawer icon color here
        ),
        title: Text("Catalog App",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.Items.length,
          itemBuilder: ( context,  index) {
            return ItemWidget(item: CatalogModel.Items[index],);
          } ,),
      ),

      drawer:
      MyDrawer(
      ),
    );
  }
}
