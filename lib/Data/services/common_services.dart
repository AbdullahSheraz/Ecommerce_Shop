import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/config/api_config.dart';

class CommonService {
  Stream<List<dynamic>> fetchCountries() async* {
    final response = await http.get(Uri.parse(getCountry));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      yield decoded['countries'] ?? [];
    } else {
      throw Exception("Failed to load countries");
    }
  }

  Stream<List<dynamic>> fetchStates(String countryId) async* {
    final response = await http.get(Uri.parse('$getState/$countryId'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      yield decoded['states'] ?? [];
    } else {
      throw Exception("Failed to load states");
    }
  }

  Stream<List<dynamic>> fetchCities(String countryId, String stateId) async* {
    final response = await http.get(Uri.parse('$getCity/$countryId/$stateId'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      yield decoded['cities'] ?? [];
    } else {
      throw Exception("Failed to load cities");
    }
  }
}
