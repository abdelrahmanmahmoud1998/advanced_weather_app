class LocationModel {
  final String? cityName;
  final String? country;
  LocationModel({this.cityName, this.country});
  factory LocationModel.getCity({required data}) {
    return LocationModel(
      cityName: data['location']['name'],
    );
  }
  factory LocationModel.getCountry({required data}) {
    return LocationModel(
      country: data['location']['country'],
    );
  }
}
