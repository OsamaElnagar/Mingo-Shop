import 'package:hive/hive.dart';
import '../../model/product.dart';

class LocalProductService {
  late Box<Product> _productBox;
  bool productFilled = false;

  Future<void> init() async {
    _productBox = await Hive.openBox<Product>('Product');
  }

  Future<void> assignAllProducts({required List<Product> products}) async {
    await _productBox.clear();
    await _productBox.addAll(products);
  }

  List<Product> getProducts() {
    var s = _productBox.values.toList();
    if (s.isNotEmpty) {
      productFilled = true;
    }
    return _productBox.values.toList();
  }
}
