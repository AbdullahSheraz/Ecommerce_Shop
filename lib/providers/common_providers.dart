import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/common_repository.dart';
part 'common_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<dynamic>> getCountries(Ref ref) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCountries();
}

@Riverpod(keepAlive: true)
Future<List<dynamic>> getStates(Ref ref, String countryId) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getStates(countryId);
}

@Riverpod(keepAlive: true)
Future<List<dynamic>> getCities(
    Ref ref, String countryId, String? stateId) async {
  final repo = ref.watch(commonRepositoryProvider);

  return repo.getCities(
    countryId,
    stateId?.isNotEmpty == true ? stateId! : "",
  );
}
@Riverpod(keepAlive: true)
Future<List<dynamic>> getCountriesCode(Ref ref) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCountriesCode();
}
