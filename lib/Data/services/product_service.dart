import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/config/api_config.dart';
import 'package:shop/data/services/auth_local_storage_services.dart';
import 'package:shop/models/brand_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/item_model.dart';

class ProductService {
  Future<List<Category>> getCategories() async {
    final token = await AuthLocalStorage.getToken();

    if (token == null) throw Exception('No token found. Please log in.');

    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.get(Uri.parse(getCategory), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      print('✅Response:  ${response.body}');
      if (body.containsKey('itemcats')) {
        final categories = body['itemcats'] as List<dynamic>;
        print(token);
        return categories.map((e) => Category.fromJson(e)).toList();
      } else {
        return [Category.fromJson(body)];
      }
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized. Invalid or expired token.');
    } else {
      ;
      throw Exception(
          'Failed to load categories. Status code: ${response.statusCode}');
    }
  }

  Future<List<Brand>> getBrands() async {
    final token = await AuthLocalStorage.getToken();

    if (token == null) throw Exception('No token found. Please log in.');

    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.get(Uri.parse(getBrand), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      print('✅Response:  ${response.body}');
      if (body.containsKey('itembrands')) {
        final brands = body['itembrands'] as List<dynamic>;
        print(token);
        return brands.map((e) => Brand.fromJson(e)).toList();
      } else {
        return [Brand.fromJson(body)];
      }
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized. Invalid or expired token.');
    } else {
      ;
      throw Exception(
          'Failed to load categories. Status code: ${response.statusCode}');
    }
  }

Future<List<Item>> getItems(String categoryId, String brandId) async {
  final token = await AuthLocalStorage.getToken();

  if (token == null) throw Exception('No token found. Please log in.');

  final headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  };

  final response = await http.get(
    Uri.parse('$getAllItems/$categoryId/$brandId'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = json.decode(response.body);
    print('✅ ResponseITEMS: ${response.body}');

    if (body.containsKey('items')) {
      final items = body['items'] as List<dynamic>;
      return items.map((e) => Item.fromJson(e)).toList();
    } else {
      return [];
    }
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized. Invalid or expired token.');
  } else {
    throw Exception(
      'Failed to load items. Status code: ${response.statusCode}',
    );
  }
}

}
