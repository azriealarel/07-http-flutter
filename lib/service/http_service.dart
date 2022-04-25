import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class HttpService {
  final String apiKey = '97e958dc1a5e0a1ec4a6879f08d5e78f';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      // ignore: avoid_print
      print('Sukses');
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      // ignore: avoid_print
      print('Fail');
      return null;
    }
  }
}