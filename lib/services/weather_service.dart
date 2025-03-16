import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

Future<Weather?> fetchWeather(String city) async {
  final response = await http.get(
    Uri.parse('https://wttr.in/$city?format=j1'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body), city);
  } else {
    return null;
  }
}
