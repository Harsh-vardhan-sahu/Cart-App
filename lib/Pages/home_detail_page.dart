import 'package:flutter/material.dart';
import 'package:flutternew/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/cart.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  bool isAdded = false;
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${widget.catalog.price}".text.bold.xl4.make(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAdded = !isAdded;
                  _cart.catalog = CatalogModel();
                  _cart.add(widget.catalog);
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: isAdded ? "Added".text.white.make() : "Add to cart".text.white.make(),
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(widget.catalog.id.toString()),
              child: Image.network(widget.catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      widget.catalog.name.text.xl4.color(context.theme.colorScheme.secondary).bold.make(),
                      widget.catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                      SizedBox(height: 10),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
