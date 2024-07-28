import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/theme_notifier.dart';
import '../../widgets/theme.dart'; // Ensure this import path is correct

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Catalog App".text.xl5.bold.color(context.theme.colorScheme.secondary).make(),
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: () {
                Provider.of<ThemeNotifier>(context, listen: false).switchTheme();
              },
            ),
          ],
        ),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
