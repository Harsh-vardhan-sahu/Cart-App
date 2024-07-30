import 'package:flutternew/models/cart.dart';
import 'package:flutternew/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

// Define your store
class MyStore extends VxStore {
  // Add your store properties and methods here
  late CatalogModel catalog;
 late  CartModel cart;
 MyStore(){
   catalog=CatalogModel();
   cart=CartModel();
   cart.catalog=catalog;
 }
}
