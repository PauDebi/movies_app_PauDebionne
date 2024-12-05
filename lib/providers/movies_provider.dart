import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:movies_app/models/models.dart';


class MoviesProvider extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '9fe6351c74744f2d1875989f8a89eeb3';
  final String _language = 'es-ES';
  final String _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> casting = {};

  MoviesProvider(){
    //print("MoviesProvider");
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  void getOnDisplayMovies() async{
       
    var url =
    Uri.https(_baseUrl, '/3/movie/now_playing', 
    {
        'api_key': _apiKey,
        'language': _language,
        'page': _page
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  void getPopularMovies() async{

    var url =
    Uri.https(_baseUrl, '/3/movie/popular', 
    {
        'api_key': _apiKey,
        'language': _language,
        'page': _page
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popular = PopularResponse.fromJson(response.body);

    popularMovies = popular.results;

    notifyListeners();
  }


  Future<List<Cast>> getMovieCast(int movieId) async{
    print("Geting cast");
    var url =
    Uri.https(_baseUrl, '/3/movie/$movieId/credits', 
    {
        'api_key': _apiKey,
        'language': _language,
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromJson(response.body);

    casting[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
