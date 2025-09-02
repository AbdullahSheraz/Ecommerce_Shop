import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shop/api/api.dart';
import 'package:shop/constants/app_sizes.dart';

final selectedCountryProvider = StateProvider<String?>((ref) => null);
final selectedStateProvider = StateProvider<String?>((ref) => null);
final selectedCityProvider = StateProvider<String?>((ref) => null);

class CountryStateCityDropdown extends ConsumerStatefulWidget {
  const CountryStateCityDropdown({super.key});

  @override
  ConsumerState<CountryStateCityDropdown> createState() =>
      _CountryStateCityDropdownState();
}

class _CountryStateCityDropdownState
    extends ConsumerState<CountryStateCityDropdown> {
  List<dynamic> countries = [];
  List<dynamic> states = [];
  List<dynamic> cities = [];

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? selectedvalue;

  @override
  void initState() {
    super.initState();
    print(selectedCountryProvider);
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse(getCountry));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print(response.body);
      final List<dynamic> data = decoded['countries'];

      setState(() {
        countries = data;
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  Future<void> fetchStates(String countryId) async {
    final response = await http.get(Uri.parse('$getState/$countryId'));

    if (response.statusCode == 200) {
      print(response.body);
      final decoded = jsonDecode(response.body);
      print(response.body);
      final List<dynamic> data = decoded['states'];

      setState(() {
        states = data;
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  Future<void> fetchCities(String countryId) async {
    final response = await http.get(Uri.parse('$getCity/$selectedvalue'));

    if (response.statusCode == 200) {
      print(response.body);
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['cities'];

      setState(() {
        cities = data;
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  InputDecoration dropdownDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color!
                .withValues(alpha: 0.15),
            width: 1.2),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Country',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        gapH4,
        DropdownButtonFormField<String>(
          value: ref.watch(selectedCountryProvider),
          decoration: dropdownDecoration("Select Country"),
          items: countries.map((c) {
            return DropdownMenuItem(
              value: c['value'].toString(),
              child: Text(c['label']),
            );
          }).toList(),
          onChanged: (value) {
            ref.read(selectedCountryProvider.notifier).state = value;
            selectedvalue = value;
            fetchStates(value!);
          },
        ),
        gapH16,
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'State',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        gapH4,
        DropdownButtonFormField<String>(
          value: ref.watch(selectedStateProvider),
          decoration: dropdownDecoration("Select State"),
          items: states.map((s) {
            return DropdownMenuItem<String>(
              value: s['value'].toString(), 
              child: Text(s['label'].toString()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              ref.read(selectedStateProvider.notifier).state = value;
              fetchCities(value!);
            });
          },
        ),
        gapH16,
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'City',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        gapH4,
   DropdownButtonFormField<String>(
  value: ref.watch(selectedCityProvider),
  decoration: dropdownDecoration("Select City"),
  items: cities.map((ct) {
    return DropdownMenuItem<String>(
      value: ct['value'].toString(),  // ensure value is String
      child: Text(ct['label'].toString()),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      ref.read(selectedCityProvider.notifier).state = value;
    });
  },
),

      ],
    );
  }
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shop/api/api.dart';
// import 'package:shop/constants/app_sizes.dart';

// class CountryDropdown extends StatefulWidget {
//   @override
//   _CountryDropdownState createState() => _CountryDropdownState();
// }

// class _CountryDropdownState extends State<CountryDropdown> {
//   List<dynamic> countries = [];
//   String? selectedCountry;

//   @override
//   void initState() {
//     super.initState();
//     fetchCountries();
//   }

//   Future<void> fetchCountries() async {
//     final response = await http.get(Uri.parse(getCountry));

//     if (response.statusCode == 200) {
//       final decoded = jsonDecode(response.body);
//       final List<dynamic> data = decoded['countries'];

//       setState(() {
//         countries = data;
//       });
//     } else {
//       print("Error: ${response.statusCode}");
//     }
//   }

//   InputDecoration dropdownDecoration(String hint) {
//     return InputDecoration(
//       filled: true,
//       fillColor: Colors.white,
//       hintText: hint,
//       hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Colors.grey.shade300),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Colors.grey.shade300),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.grey, width: 1.5),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Conutry',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//         ),
//         gapH4,
//         DropdownButtonFormField<String>(
//           value: selectedCountry,
//           decoration: dropdownDecoration("Select Country"),
//           items: countries.map((country) {
//             return DropdownMenuItem(
//               value: country['value'].toString(),
//               child: Text(country['label']),
//             );
//           }).toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedCountry = value;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
