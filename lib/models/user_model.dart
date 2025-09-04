
class UserModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final int roleId;
  final String phone;
  final int phoneCode;
  final int countryId;
  final int stateId;
  final int cityId;
  final String address;
  final String postalCode;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.roleId,
    required this.phone,
      required this.phoneCode,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.postalCode,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      roleId: json['roleid'] ?? 1,
      phone: json['phone'] ?? '',
        phoneCode: json['phonecode'] ?? '+92',
      countryId: json['country_id'] ?? 0,
      stateId: json['state_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      address: json['address'] ?? '',
      postalCode: json['postalcode'] ?? '',
      imageUrl: json['image'] ?? 'assets/images/its.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'roleid': roleId,
      'phone': phone,
       'phonecode': phoneCode,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'address': address,
      'postalcode': postalCode,
      'image': imageUrl,
    };
  }
}
