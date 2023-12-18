import '../../../adapters/http_adapter.dart';
import '../../../env/env.dart';
import '../../../exceptions/api/no_api_response_exception.dart';
import '../../../exceptions/api/unexpected_api_exception.dart';
import '../base_provider.dart';

class MovieProvider extends BaseProvider {
  MovieProvider({
    required Http http,
  }) : _http = http;

  final Http _http;

  /// Get movies from discover endpoint. Can filter by genres and also select both page and language.
  ///
  /// `GET` `/discover/movie`
  ///
  /// ### Authenticated
  /// `true`
  ///
  /// ### Path Variables
  /// `none`
  ///
  /// ### Request Parameters
  /// + `api_key` API key.
  /// + `page` Page of movies discover.
  /// + `language` Language used in results.
  /// + `with_genres` Filter movies that have any genre in the list (OR).
  /// + `without_genres` Filter movies that does not have any genre in the list (AND).
  ///
  /// ### Request body
  /// `none`
  ///
  /// ### Responses
  /// `200`
  /// ```json
  /// {
  ///   "page": integer,
  ///   "results": [
  ///     {
  ///       "adult": boolean,
  ///       "backdrop_path": string,
  ///       "genre_ids": [
  ///         integer
  ///       ],
  ///       "id": integer,
  ///       "original_language": string,
  ///       "original_title": string,
  ///       "overview": string,
  ///       "popularity": number,
  ///       "poster_path": string,
  ///       "release_date": string,
  ///       "title": string,
  ///       "video": boolean,
  ///       "vote_average": number,
  ///       "vote_count": integer
  ///     }
  ///   ]
  ///   "total_pages": int,
  ///   "total_results": int
  /// }
  /// ```
  Future<Map<String, dynamic>> getMovies({
    int page = 1,
    String language = "en-US",
    List<int> withGenres = const [],
    List<int> withoutGenres = const [],
  }) async {
    try {
      final response = await _http.get(
        "/discover/movie",
        headers: {
          "Authorization": "Bearer ${Env.apiKey}",
        },
        query: {
          "api_key": Env.apiKey,
          "page": page,
          "language": language,
          "with_genres": withGenres.join(","),
          "without_genres": withoutGenres.join(","),
        },
      );
      print(response);

      validateResponse(
        response: response,
        statusCodes: [200],
      );

      return response.data;
    } on NoApiResponseException {
      rethrow;
    } catch (e) {
      logError(e.toString());
      throw UnexpectedApiException();
    }
  }

  /// Get movies from search endpoint. Can filter by query and also select both page and language.
  ///
  /// `GET` `/search/movie`
  ///
  /// ### Authenticated
  /// `true`
  ///
  /// ### Path Variables
  /// `none`
  ///
  /// ### Request Parameters
  /// + `api_key` API key.
  /// + `query` Query to search movies.
  /// + `page` Page of movies discover.
  /// + `language` Language used in results.
  ///
  /// ### Request body
  /// `none`
  ///
  /// ### Responses
  /// `200`
  /// ```json
  /// {
  ///   "page": integer,
  ///   "results": [
  ///     {
  ///       "adult": boolean,
  ///       "backdrop_path": string,
  ///       "genre_ids": [
  ///         integer
  ///       ],
  ///       "id": integer,
  ///       "original_language": string,
  ///       "original_title": string,
  ///       "overview": string,
  ///       "popularity": number,
  ///       "poster_path": string,
  ///       "release_date": string,
  ///       "title": string,
  ///       "video": boolean,
  ///       "vote_average": number,
  ///       "vote_count": integer
  ///     }
  ///   ],
  ///   "total_pages": int,
  ///   "total_results": int
  /// }
  /// ```
  Future<Map<String, dynamic>> getMoviesByName({
    required String query,
    int page = 1,
    String language = "en-US",
  }) async {
    try {
      final response = await _http.get(
        "/search/movie",
        query: {
          "api_key": Env.apiKey,
          "query": query,
          "page": page,
          "language": language,
        },
      );

      validateResponse(
        response: response,
        statusCodes: [200],
      );

      return response.data;
    } on NoApiResponseException {
      rethrow;
    } catch (e) {
      logError(e.toString());
      throw UnexpectedApiException();
    }
  }

  /// Get movie details from movie endpoint. Can select language.
  ///
  /// `GET` `/movie/{movie_id}`
  ///
  /// ### Authenticated
  /// `true`
  ///
  /// ### Path Variables
  /// + `movie_id` Movie id.
  ///
  /// ### Request Parameters
  /// + `api_key` API key.
  /// + `language` Language used in results.
  ///
  /// ### Request body
  /// `none`
  ///
  /// ### Responses
  /// `200`
  /// ```json
  /// {
  ///   "adult": boolean,
  ///   "backdrop_path": string,
  ///   "belongs_to_collection": {
  ///     "id": integer,
  ///     "name": string,
  ///     "poster_path": string,
  ///     "backdrop_path": string
  ///   },
  ///   "budget": integer,
  ///   "genres": [
  ///     {
  ///       "id": integer,
  ///       "name": string
  ///     }
  ///   ],
  ///   "homepage": string,
  ///   "id": integer,
  ///   "imdb_id": string,
  ///   "original_language": string,
  ///   "original_title": string,
  ///   "overview": string,
  ///   "popularity": number,
  ///   "poster_path": string,
  ///   "production_companies": [
  ///     {
  ///       "id": integer,
  ///       "logo_path": string,
  ///       "name": string,
  ///       "origin_country": string
  ///     }
  ///   ],
  ///   "production_countries": [
  ///     {
  ///       "iso_3166_1": string,
  ///       "name": string
  ///     }
  ///   ],
  ///   "release_date": string,
  ///   "revenue": integer,
  ///   "runtime": integer,
  ///   "spoken_languages": [
  ///     {
  ///       "english_name": string,
  ///       "iso_639_1": string,
  ///       "name": string
  ///     }
  ///   ],
  ///   "status": string,
  ///   "tagline": string,
  ///   "title": string,
  ///   "video": boolean,
  ///   "vote_average": number,
  ///   "vote_count": integer
  /// }
  /// ```
  Future<Map<String, dynamic>> getMovieDetails({
    required int id,
    String language = "en-US",
  }) async {
    try {
      final response = await _http.get(
        "/movie/$id",
        query: {
          "api_key": Env.apiKey,
          "language": language,
        },
      );

      validateResponse(
        response: response,
        statusCodes: [200],
      );

      return response.data;
    } on NoApiResponseException {
      rethrow;
    } catch (e) {
      logError(e.toString());
      throw UnexpectedApiException();
    }
  }
}
