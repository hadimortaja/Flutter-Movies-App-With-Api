import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies_app_api/data/core/api_constants.dart';
import 'package:movies_app_api/data/models/movie_model.dart';
import 'package:movies_app_api/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  var _client = http.Client();
  MovieRemoteDataSourceImpl(this._client);

  Future<List<MovieModel>> getTrending() async {
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/trending/movie/day?api_key=a76a130164d24c71bf5ab829183bf343'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
        throw Exception(response.reasonPhrase);    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=a76a130164d24c71bf5ab829183bf343'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
