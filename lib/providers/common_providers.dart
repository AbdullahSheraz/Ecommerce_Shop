import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/common_repository.dart';
part 'common_providers.g.dart';

@riverpod
Future<List<dynamic>> getCountries(GetCountriesRef ref) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCountries();
}

@riverpod
Future<List<dynamic>> getStates(GetStatesRef ref, String countryId) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getStates(countryId);
}

@riverpod
Future<List<dynamic>> getCities(
    GetCitiesRef ref, String countryId, String? stateId) async {
  final repo = ref.watch(commonRepositoryProvider);

  return repo.getCities(
    countryId,
    stateId?.isNotEmpty == true ? stateId! : "",
  );
}
