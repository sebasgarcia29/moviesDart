class Peliculas {
  List<Pelicula> items = [];

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) {
      return;
    }
    for (var item in json) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterImg(){
    if(posterPath == null){
    return 'https://m.media-amazon.com/images/I/71OFozfY-cL._SS500_.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }


}