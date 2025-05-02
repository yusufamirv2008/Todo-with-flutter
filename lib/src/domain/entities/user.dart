  class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final Address address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });
}

class Address {
  final String street;
  final String city;
  final Geo geo;

  Address({
    required this.street,
    required this.city,
    required this.geo,
  });

  toJson() {}
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });
}
