class Weather {
  final String cityName;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json, String city) {
    var weatherData = json['current_condition'][0]; // Current weather

    return Weather(
      cityName: city,
      temperature: double.parse(weatherData['temp_C']),
      tempMin: double.parse(json['weather'][0]['mintempC']),
      tempMax: double.parse(json['weather'][0]['maxtempC']),
      description: weatherData['weatherDesc'][0]['value'],
    );
  }
}
