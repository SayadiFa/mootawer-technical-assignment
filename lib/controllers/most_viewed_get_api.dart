import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mootawer_technical_test/models/article_home_screen_object.dart';

Future<List<ArticleObject>?> getArticles() async {

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=ZyV009QDRHHBnUiYevAC4NbfchYBAbBf'));

  http.StreamedResponse response = await request.send();

  List<ArticleObject> articleList = [];

  if (response.statusCode == 200) {
    var resp = await response.stream.bytesToString();
    var tagObjsJson = jsonDecode(resp);

    // var result = tagObjsJson['results'].length;



    String imageCaption = '';

    for (int articleIndex = 0;
        articleIndex < tagObjsJson['results'].length;
        articleIndex++) {
      List<String> imageList = [];
      for (int mediaIndex = 0;
          mediaIndex < tagObjsJson['results'][articleIndex]['media'].length;
          mediaIndex++) {
        if (tagObjsJson['results'][articleIndex]['media'][mediaIndex]['caption'] != null)
          imageCaption = tagObjsJson['results'][articleIndex]['media'][mediaIndex]['caption'];
        for (int metaDataIndex = 0;
            metaDataIndex <
                tagObjsJson['results'][articleIndex]['media'][mediaIndex]
                        ['media-metadata']
                    .length;
            metaDataIndex++) {
          String imageLink = tagObjsJson['results'][articleIndex]['media']
              [mediaIndex]['media-metadata'][metaDataIndex]['url'];

          imageList.add(imageLink);
        }
      }

      ArticleObject articleObject = ArticleObject(
        title: tagObjsJson['results'][articleIndex]["title"],
        abstract: tagObjsJson['results'][articleIndex]["abstract"],
        imagesList: imageList,
        writer: tagObjsJson['results'][articleIndex]["byline"],
        date: tagObjsJson['results'][articleIndex]["published_date"],
        id: tagObjsJson['results'][articleIndex]["id"],
        articleLink: tagObjsJson['results'][articleIndex]["url"],caption: imageCaption
      );

      articleList.add(articleObject);
    }

    articleList = articleList;
    return articleList;
  } else {
    return null;
  }
}
