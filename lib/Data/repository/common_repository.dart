import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/services/common_services.dart';
part 'common_repository.g.dart';

@riverpod
CommonRepository commonRepository(ref) {
  return CommonRepository();
}

class CommonRepository {
  final CommonService commonService = CommonService();

  Stream<List<dynamic>> getCountries() {
    return commonService.fetchCountries();
  }

  Stream<List<dynamic>> getStates(String countryId) {
    return commonService.fetchStates(countryId);
  }

  Stream<List<dynamic>> getCities(String countryId, String stateId) {
    return commonService.fetchCities(countryId, stateId);
  }
}
