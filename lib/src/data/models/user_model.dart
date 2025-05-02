import '../../domain/entities/user.dart';

// Модел
class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String website,
    required AddressModel address,
  }) : super(
         id: id,
         name: name,
         email: email,
         phone: phone,
         website: website,
         address: address,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: AddressModel.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
      'address': (address as AddressModel).toJson(),
    };
  }
}

class AddressModel extends Address {
  AddressModel({
    required String street,
    required String city,
    required GeoModel geo,
  }) : super(street: street, city: city, geo: geo);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      city: json['city'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'street': street, 'city': city, 'geo': (geo as GeoModel).toJson()};
  }
}

class GeoModel extends Geo {
  GeoModel({required String lat, required String lng})
    : super(lat: lat, lng: lng);

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}
