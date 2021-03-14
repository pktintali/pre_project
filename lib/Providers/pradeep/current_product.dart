import 'package:flutter/material.dart';
import 'package:pre_project/data/Product.dart';

class CurrentProduct with ChangeNotifier {
  Product product;
  bool uploading = false;
  void addProduct({@required Product prod}) {
    product = prod;
    notifyListeners();
  }

  void toogleUploading() {
    uploading = !uploading;
    notifyListeners();
  }
}
