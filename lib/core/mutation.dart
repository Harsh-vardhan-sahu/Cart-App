import 'package:flutternew/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutternew/models/cart.dart';
import 'package:flutternew/models/catalog.dart';

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart.add(item);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart.remove(item);
  }
}
