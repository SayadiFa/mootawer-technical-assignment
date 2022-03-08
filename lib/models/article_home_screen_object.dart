
class ArticleObject {


  String title;
  String abstract;
  String? caption;
  List <String> imagesList;
  String writer;
  String date;
  String articleLink;
  int id;

  ArticleObject({

    required this.title,
    required this.abstract,
    this.caption,
    required this.imagesList,
    required this.writer,
    required this.date,
    required this.articleLink,
    required this.id,

  });

}