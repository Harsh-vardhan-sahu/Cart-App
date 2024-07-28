import 'package:flutter/material.dart';
import 'package:flutternew/Pages/home_detail_page.dart';
import 'package:flutternew/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../widgets/theme.dart';
import 'catalog_image.dart';
 // Import the new widget

class CatalogList extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.theme.colorScheme.secondary).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _AddToCart(catalog: catalog), // Use the new widget here
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
class _AddToCart extends StatefulWidget {
  final Item catalog;

  const _AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isAdded = isAdded.toggle();
          final _catalog=CatalogModel();
          final _cart=CartModel();
          _cart.catalog=_catalog;
          _cart.add(widget.catalog);
          setState(() {

          });
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: (isAdded ? "Added" : "Buy").text.white.make(),
    );
  }
}