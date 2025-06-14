import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../main.dart'; // importa tmdbApiKey

class MovieService {
  static final String _apiKey = tmdbApiKey;
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/popular?api_key=$_apiKey&language=pt-BR&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes populares');
    }
  }
}
