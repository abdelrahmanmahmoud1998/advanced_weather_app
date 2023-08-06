class HourlyModel {
  final String hourlyIcon;
  final double hourlyTemp;
  HourlyModel({required this.hourlyIcon, required this.hourlyTemp});
  factory HourlyModel.fromJson({required data}) {
    return HourlyModel(
      hourlyIcon: data['condition']['icon'],
      hourlyTemp: data['temp_c'],
    );
  }
}
