import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/config/api_config.dart';

class CommonService {
  Future<List<dynamic>> fetchCountries() async {
    final response = await http.get(Uri.parse(getCountry));
     if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['countries'] ?? [];
    } else {
      throw Exception("Failed to load countries");
    }
  }

  Future<List<dynamic>> fetchStates(String countryId) async {
    final response = await http.get(Uri.parse('$getState/$countryId'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['states'] ?? [];
    } else {
      throw Exception("Failed to load states}");
    }
  }

  Future<List<dynamic>> fetchCities(String countryId, String? stateId) async {
    final url = (stateId == null || stateId.isEmpty)
        ? '$getCity/$countryId'
        : '$getCity/$countryId/$stateId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['cities'] ?? [];
    } else {
      throw Exception("Failed to load cities");
    }
  }
}
