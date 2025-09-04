import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/providers/common_providers.dart';

final selectedCountryProvider = StateProvider<String?>((ref) => null);
final selectedStateProvider = StateProvider<String?>((ref) => null);
final selectedCityProvider = StateProvider<String?>((ref) => null);
final selectedCountryCallingCodeProvider =
    StateProvider<String?>((ref) => null);

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

    final countriesAsync = ref.watch(getCountriesProvider);
    final statesAsync = selectedCountry != null
        ? ref.watch(getStatesProvider(selectedCountry))
        : const AsyncValue.data([]);
    final citiesAsync = (selectedCountry != null && selectedState != null)
        ? ref.watch(getCitiesProvider(selectedCountry, selectedState))
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
            dropdownColor: Colors.white,
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
              final selectedCountryObj =
                  countries.firstWhere((c) => c['value'].toString() == value);
              ref.read(selectedCountryCallingCodeProvider.notifier).state =
                  selectedCountryObj['calling_code'].toString();
            },
          ),
          loading: () => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          error: (e, _) => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text("Error loading countries",
                style: TextStyle(color: Colors.red)),
          ),
        ),
        gapH16,
        const Text('State',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        gapH4,
        statesAsync.when(
          data: (states) => DropdownButtonFormField<String>(
            value: selectedState,
            dropdownColor: Colors.white,
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
          loading: () => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          error: (e, _) => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text("Error loading state",
                style: TextStyle(color: Colors.red)),
          ),
        ),
        gapH16,
        const Text('City',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        gapH4,
        citiesAsync.when(
          data: (cities) => DropdownButtonFormField<String>(
            value: selectedCity,
            dropdownColor: Colors.white,
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
          loading: () => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          error: (e, _) => Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text("Error loading cities",
                style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
