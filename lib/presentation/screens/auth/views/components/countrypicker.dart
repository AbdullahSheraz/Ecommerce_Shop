import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/data/providers/common_providers.dart';

final selectedCountryProvider = StateProvider<String?>((ref) => null);
final selectedStateProvider = StateProvider<String?>((ref) => null);
final selectedCityProvider = StateProvider<String?>((ref) => null);

class CountryStateCityDropdown extends ConsumerWidget {
  const CountryStateCityDropdown({super.key});

  InputDecoration dropdownDecoration(BuildContext context, String hint) {
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
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectedCountryProvider);
    final selectedState = ref.watch(selectedStateProvider);
    final selectedCity = ref.watch(selectedCityProvider);
    
    final countriesAsync = ref.watch(countriesProvider);
    final statesAsync = selectedCountry != null
        ? ref.watch(statesProvider(selectedCountry))
        : const AsyncValue.data([]);
    final citiesAsync = (selectedCountry != null && selectedState != null)
        ? ref.watch(citiesProvider(selectedCountry, selectedState))
        : const AsyncValue.data([]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Country',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        gapH4,
        countriesAsync.when(
          data: (countries) => DropdownButtonFormField<String>(
            value: selectedCountry,
            decoration: dropdownDecoration(context, "Select Country"),
            items: countries.map((c) {
              return DropdownMenuItem(
                value: c['value'].toString(),
                child: Text(c['label'].toString()),
              );
            }).toList(),
            onChanged: (value) {
              ref.read(selectedCountryProvider.notifier).state = value;
              ref.read(selectedStateProvider.notifier).state = null;
              ref.read(selectedCityProvider.notifier).state = null;
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error loading countries: $e"),
        ),
        gapH16,
        const Text('State',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        gapH4,
        statesAsync.when(
          data: (states) => DropdownButtonFormField<String>(
            value: selectedState,
            decoration: dropdownDecoration(context, "Select State"),
            items: states.map((s) {
              return DropdownMenuItem(
                value: s['value'].toString(),
                child: Text(s['label'].toString()),
              );
            }).toList(),
            onChanged: (value) {
              ref.read(selectedStateProvider.notifier).state = value;
              ref.read(selectedCityProvider.notifier).state = null;
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error loading states: $e"),
        ),
        gapH16,
        const Text('City',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        gapH4,
        citiesAsync.when(
          data: (cities) => DropdownButtonFormField<String>(
            value: selectedCity,
            decoration: dropdownDecoration(context, "Select City"),
            items: cities.map((ct) {
              return DropdownMenuItem(
                value: ct['value'].toString(),
                child: Text(ct['label'].toString()),
              );
            }).toList(),
            onChanged: (value) {
              ref.read(selectedCityProvider.notifier).state = value;
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error loading cities: $e"),
        ),
      ],
    );
  }
}
