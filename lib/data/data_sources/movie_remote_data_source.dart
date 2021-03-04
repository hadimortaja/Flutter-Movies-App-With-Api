
import 'package:movies_app_api/data/core/api_client.dart';
import 'package:movies_app_api/data/models/movie_detail_model.dart';

import 'package:movies_app_api/data/models/movie_model.dart';
import 'package:movies_app_api/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
    Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async{
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow()async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id)async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }
}
