import 'package:flutter/material.dart';

class LikedProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> liked = [];

  void addProduct(Map<String, dynamic> product) {
    liked.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    liked.remove(product);
    notifyListeners();
  }
}
