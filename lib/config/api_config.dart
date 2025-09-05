Map<String, String> defaultHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json",
};

String api = 'https://bizpro24.top/bck/api/public/api';
String userLogin = '$api/app-login';
String userRegistor = '$api/register-app-user';
String updatePassword = '$api/update-app-password';
String getUserInfo = '$api/edit-app-user';
String getCountry = '$api/get-countries';
String getState = '$api/get-countrywise-states';
String getCity = '$api/get-countrywise-cities';
String getCountryCode = '$api/get-country-codes';
String getCategory = '$api/get-item-cats';
String getBrand = '$api/get-item-brands';
String getAllItems = '$api/get-app-items';
