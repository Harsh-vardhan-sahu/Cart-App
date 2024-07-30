import 'package:flutter/material.dart';
import 'package:flutternew/core/store.dart';
import 'package:flutternew/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  final TextEditingController _couponController = TextEditingController();
  double _discount = 0;

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    double totalPrice = _cart.totalPrice - _discount;

    return SizedBox(
      height: 250,
      child: Column(
        children: [
          TextField(
            controller: _couponController,
            decoration: InputDecoration(
              hintText: "Enter coupon code",
              suffixIcon: IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    if (_couponController.text == "kani") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: "Congratulations !".text.make(),
                          backgroundColor: Colors.green,
                        ),
                      );
                      _discount = _cart.totalPrice * 0.999;

                      // 10% discount
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: "Incorrect coupon code.".text.make(),
                          backgroundColor: Colors.red,
                        ),
                      );
                      _discount = 0;
                    }
                  });
                },
              ),
            ),
          ).p16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "\$${totalPrice.toStringAsFixed(2)}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.primary)
                  .make(),
              30.widthBox,
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Buying not supported yet.".text.make(),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.theme.colorScheme.primary,
                  ),
                ),
                child: "Buy".text.white.make(),
              ).w32(context),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            _cart.remove(_cart.items[index]);
            UpdateCartMutation(_cart); // Trigger VxState mutation
          },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}

// Define a mutation to trigger VxState update
class UpdateCartMutation extends VxMutation<MyStore> {
  final CartModel cart;

  UpdateCartMutation(this.cart);

  @override
  perform() {
    store!.cart = cart;
  }
}
