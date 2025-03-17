import 'package:flutter/material.dart';
import 'models/weather.dart';
import 'services/weather_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  Weather? weather;
  bool isLoading = true;
  String city = "Karachi"; // Default city

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    final fetchedWeather = await fetchWeather(city);
    setState(() {
      weather = fetchedWeather;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : weather == null
                ? const Text("Failed to load weather data")
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weather!.cityName,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${weather!.temperature.toStringAsFixed(1)}°C",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text("High: ${weather!.tempMax.toStringAsFixed(1)}°C"),
                      Text("Low: ${weather!.tempMin.toStringAsFixed(1)}°C"),
                      Text(
                        weather!.description,
                        style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
      ),
    );
  }
}
