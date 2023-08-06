class LocationModel {
  final String? cityName;
  final String? country;
  LocationModel({this.cityName, this.country});
  factory LocationModel.fromJson({required data}) {
    return LocationModel(
      cityName: data['location']['name'],
      country: data['location']['country'],
    );
  }
}
