import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutternew/models/catalog.dart';
import 'package:flutternew/core/store.dart';
import '../core/mutation.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    final cart = (VxState.store as MyStore).cart;
    isAdded = cart.items.contains(widget.catalog);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isAdded) {
          AddMutation(widget.catalog);
        } else {
          RemoveMutation(widget.catalog);
        }
        setState(() {
          isAdded = !isAdded;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Icon(
        isAdded ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
        color: Colors.white,
      ),
    ).wh(80, 40);  // Ensuring the button size fits within the layout
  }
}
