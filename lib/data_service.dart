import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';


class DataService {
  Future<WeatherResponse> getWeather(String city) async {


    final queryParameters = {
      'q': city,
      'appid': 'dc967ecd87a4e079abe9aaabbc8404ea',
      'units': 'imperial'
    };

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}