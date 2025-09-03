import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/common_repository.dart';
part 'common_providers.g.dart';

@riverpod
Stream<List<dynamic>> countries(CountriesRef ref) {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCountries();
}

@riverpod
Stream<List<dynamic>> states(StatesRef ref, String countryId) {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getStates(countryId);
}

@riverpod
Stream<List<dynamic>> cities(CitiesRef ref, String countryId, String stateId) {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCities(countryId, stateId);
}
