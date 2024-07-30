import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutternew/utils/theme_notifier.dart';
import 'package:flutternew/models/catalog.dart';
import 'package:flutternew/utils/routes.dart';
import 'package:flutternew/core/store.dart';
import 'package:flutternew/widgets/home_widgets/catalog_header.dart';
import 'package:flutternew/widgets/home_widgets/catalog_list.dart';
import '../core/mutation.dart';
import '../models/addtocart.dart';
import 'home_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: context.theme.colorScheme.primary,
        ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: CatalogModel.items.length,
                    itemBuilder: (context, index) {
                      final catalog = CatalogModel.items[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeDetailPage(catalog: catalog),
                            ),
                          );
                        },
                        child: VxBox(
                          child: Row(
                            children: [
                              Hero(
                                tag: Key(catalog.id.toString()),
                                child: Image.network(catalog.image).box.rounded.p8.color(context.canvasColor).make().p16().w40(context),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    catalog.name.text.lg.color(context.accentColor).bold.make(),
                                    catalog.desc.text.textStyle(context.captionStyle).make(),
                                    10.heightBox,
                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      buttonPadding: EdgeInsets.zero,
                                      children: [
                                        "\$${catalog.price}".text.bold.xl.make(),
                                        AddToCart(catalog: catalog), // Use AddToCart widget
                                      ],
                                    ).pOnly(right: 8.0)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ).color(context.cardColor).roundedLg.square(150).make().py16(),
                      );
                    },
                  ),
                )
              else
                Center(
                  child: CircularProgressIndicator().py16(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
