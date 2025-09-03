import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/common_repository.dart';
part 'common_providers.g.dart';

@riverpod
Future<List<dynamic>> countries(CountriesRef ref) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCountries();
}

@riverpod
Future<List<dynamic>> states(StatesRef ref, String countryId) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getStates(countryId);
}

@riverpod
Future<List<dynamic>> cities(CitiesRef ref, String countryId,String stateId) async {
  final repo = ref.watch(commonRepositoryProvider);
  return repo.getCities(countryId,stateId);
}
