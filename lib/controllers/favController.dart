// favorite_controller.dart
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteItems = <Map<String, dynamic>>[].obs;

  void addItem(Map<String, dynamic> product) {
    // Check if the item already exists in the favorites
    var existItem = favoriteItems.indexWhere((item) => item['name'] == product['name']);

    if (existItem == -1) {
      favoriteItems.add(product);
    }
  }

  void removeItem(int index) {
    favoriteItems.removeAt(index);
  }
}
