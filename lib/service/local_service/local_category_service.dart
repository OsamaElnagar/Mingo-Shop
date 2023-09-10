import 'package:hive/hive.dart';
import '../../model/category.dart';

class LocalCategoryService {
  late Box<Category> _popularCategoryBox;
  late Box<Category> _categoryBox;
  bool categoryFilled = false;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategories');
    _categoryBox = await Hive.openBox<Category>('Categories');
  }

  Future<void> assignAllPopularCategory(
      {required List<Category> categories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(categories);
  }

  Future<void> assignAllCategory({required List<Category> categories}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(categories);
  }

  List<Category> getPopularCategories() {
    var s = _popularCategoryBox.values.toList();
    if (s.isNotEmpty) {
      categoryFilled = true;
    }
    return _popularCategoryBox.values.toList();
  }

  List<Category> getCategories() {
    return _categoryBox.values.toList();
  }
}
