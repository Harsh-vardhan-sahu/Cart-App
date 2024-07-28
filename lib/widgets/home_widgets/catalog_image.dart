import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2), // Padding inside the container
      decoration: BoxDecoration(
       // color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(3), // Rounded corners
      ),
      child: Image.network(image)
          .box
          .rounded
          .make()
          .p8()
          .color(context.canvasColor)
          .w32(context)
    ).p8(); // Padding outside the container
  }
}
