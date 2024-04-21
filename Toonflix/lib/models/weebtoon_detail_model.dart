class WebtoonDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
