import 'package:hive_flutter/adapters.dart';
import 'package:moneymanagement/model/category/category_model.dart';

const CATEGORY_DB_NAME = 'categorydatabase';

abstract class CategoryDbFunction {
  Future<List<CategoryModel>> getCategories();

  Future<void> insertCategory(CategoryModel category);
}

class CategoryDB implements CategoryDbFunction {
  @override
  Future<void> insertCategory(CategoryModel category) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.add(category);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _Categorydb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _Categorydb.values.toList();
  }
}
