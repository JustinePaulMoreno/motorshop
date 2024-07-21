import 'package:flutter/foundation.dart';
import 'product_model.dart';

class Cart with ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  void addProduct(Product product, int quantity) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + quantity;
    } else {
      _items[product] = quantity;
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    if (_items.containsKey(product)) {
      if (_items[product]! > 1) {
        _items[product] = _items[product]! - 1;
      } else {
        _items.remove(product);
      }
      notifyListeners();
    }
  }

  void updateProductQuantity(Product product, int quantity) {
    if (quantity > 0) {
      _items[product] = quantity;
    } else {
      _items.remove(product);
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    _items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
