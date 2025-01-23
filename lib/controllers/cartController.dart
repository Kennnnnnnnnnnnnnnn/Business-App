import 'package:get/get.dart';

class CartsController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;
  var cartItemCount = 0.obs;

  void addItem(Map<String, dynamic> product) {
    // Check if the item already exists in the cart
    var existingItemIndex =
        cartItems.indexWhere((item) => item['name'] == product['name']);

    if (existingItemIndex != -1) {
      // If item exists, increase the quantity
      cartItems[existingItemIndex]['quantity'] += 1;
      cartItems.refresh(); // Refresh the cart items list
    } else {
      // If item doesn't exist, add new item with quantity 1
      product['quantity'] = 1;
      cartItems.add(product);
    }
    cartItemCount.value = cartItems.length; // Update cart item count
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    cartItemCount.value = cartItems.length; // Update cart item count
  }
  void clearCart() {
    cartItems.clear();
    cartItemCount.value = 0; // Update cart item count
  }
}
