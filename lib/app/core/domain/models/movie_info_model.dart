import 'genre_model.dart';
import 'person_model.dart';
import 'production_company_model.dart';

class MovieInfoModel {
  MovieInfoModel({
    required this.id,
    this.imageFileName,
    required this.averageVote,
    required this.title,
    required this.originalTitle,
    required this.releaseYear,
    required this.duration,
    required this.genres,
    required this.description,
    required this.budget,
    required this.productionCompanies,
    required this.directors,
    required this.cast,
  });

  int id;
  String? imageFileName;
  double averageVote;
  String title;
  String originalTitle;
  int releaseYear;
  Duration duration;
  List<GenreModel> genres;
  String description;
  int budget;
  List<ProductionCompanyModel> productionCompanies;
  List<PersonModel> directors;
  List<PersonModel> cast;
}
