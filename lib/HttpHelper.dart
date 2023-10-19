import 'package:http/http.dart' as http;
import 'package:my_project/home.dart';
import 'dart:convert';
import 'dart:io';
import 'package:my_project/movies.dart';

class HttpHelper {
  final String _urlKey = "?api_key=25d6d05bf559e0a5e5e5655520f3b9d9";
  final String _urlBase = "https://api.themoviedb.org/3/movie";

  Future<List<Movie>> getMoviesByCategory(MovieCategory category, String keyword) async {
    String categoryPath = '';
    switch (category) {
      case MovieCategory.Latest:
        categoryPath = 'latest';
        break;
      case MovieCategory.NowPlaying:
        categoryPath = 'now_playing';
        break;
      case MovieCategory.Popular:
        categoryPath = 'popular';
        break;
      case MovieCategory.TopRated:
        categoryPath = 'top_rated';
        break;
      case MovieCategory.Upcoming:
        categoryPath = 'upcoming';
        break;
    }
    
    var url = Uri.parse(_urlBase + '/' + categoryPath + _urlKey + '&query=$keyword');
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies = moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
