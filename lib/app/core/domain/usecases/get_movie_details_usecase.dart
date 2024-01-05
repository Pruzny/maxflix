import '../../constants.dart';
import '../models/movie_info_model.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailsUsecase {
  GetMovieDetailsUsecase({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<MovieInfoModel> call({
    required int id,
    String language = Constants.defaultLocaleTag,
  }) async {
    return _repository.getMovieDetails(
      id: id,
      language: language,
    );
  }
}
