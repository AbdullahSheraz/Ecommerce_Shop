import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/services/common_services.dart';
part 'common_repository.g.dart';
@riverpod
CommonRepository commonRepository(ref) {
  return CommonRepository();
}

class CommonRepository {
  final CommonService commonService = CommonService();

  Future<List<dynamic>> getCountries() async {
    return await commonService.fetchCountries();
  }

  Future<List<dynamic>> getStates(String countryId) async {
    return await commonService.fetchStates(countryId);
  }

  Future<List<dynamic>> getCities(String countryId,String stateId) async {
    return await commonService.fetchCities(countryId,stateId);
  }
}
