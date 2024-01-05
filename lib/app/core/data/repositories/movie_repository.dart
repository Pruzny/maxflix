import '../../constants.dart';
import '../../domain/models/genre_model.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../exceptions/api/unexpected_api_exception.dart';
import '../dtos/movie_info_dto.dart';
import '../dtos/movie_preview_dto.dart';
import '../providers/api/movie_provider.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl({
    required movieProvider,
    required List<GenreModel> genres,
  })  : _movieProvider = movieProvider,
        _genres = genres;

  final MovieProvider _movieProvider;
  final List<GenreModel> _genres;

  @override
  Future<List<MoviePreviewDto>> getMovies({
    int page = 1,
    String language = Constants.defaultLocaleTag,
    List<GenreModel> withGenres = const [],
    List<GenreModel> withoutGenres = const [],
  }) async {
    final withGenresIds = withGenres.map((genre) => genre.id).toList();
    final withoutGenresIds = withoutGenres.map((genre) => genre.id).toList();

    final response = await _movieProvider.getMovies(
      page: page,
      language: language,
      withGenres: withGenresIds,
      withoutGenres: withoutGenresIds,
    );

    if (response["results"] == null) {
      throw UnexpectedApiException(message: "No movie results");
    }

    final List results = response["results"];
    final moviesAsDto = results.map(
      (movie) {
        final movieDto = MoviePreviewDto.fromMap(movie);

        // Map genre IDs to models
        movieDto.genres.clear();
        for (int genreId in movieDto.genreIds) {
          movieDto.genres.add(
            _genres.firstWhere(
              (genre) => genre.id == genreId,
            ),
          );
        }

        return movieDto;
      },
    ).toList();

    return moviesAsDto;
  }

  @override
  Future<List<MoviePreviewDto>> getMoviesByName({
    int page = 1,
    String language = Constants.defaultLocaleTag,
    String query = "",
  }) async {
    final response = await _movieProvider.getMoviesByName(
      page: page,
      language: language,
      query: query,
    );

    if (response["results"] == null) {
      throw UnexpectedApiException(message: "No movie results");
    }

    final List results = response["results"];
    final moviesAsDto = results.map(
      (movie) {
        final movieDto = MoviePreviewDto.fromMap(movie);

        // Map genre IDs to models
        movieDto.genres.clear();
        for (int genreId in movieDto.genreIds) {
          movieDto.genres.add(
            _genres.firstWhere(
              (genre) => genre.id == genreId,
            ),
          );
        }

        return movieDto;
      },
    ).toList();

    return moviesAsDto;
  }

  @override
  Future<MovieInfoDto> getMovieDetails({
    required int id,
    String language = Constants.defaultLocaleTag,
  }) async {
    final response = await _movieProvider.getMovieDetails(
      id: id,
      language: language,
    );

    response.addAll(
      await _movieProvider.getMovieCredits(
        id: id,
        language: language,
      ),
    );

    final movieDto = MovieInfoDto.fromMap(response);

    return movieDto;
  }
}
