// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mootawer_technical_test/controllers/most_viewed_get_api.dart';
// import 'package:mootawer_technical_test/models/article_home_screen_object.dart';
//
// import 'most_viewed_get_api_test.mocks.mocks.dart';
//
// // Generate a MockClient using the Mockito package.
// // Create new instances of this class in each test.
// @GenerateMocks([http.Client])
// void main() {
//   group('getArticles', () {
//     test('returns an Article if the http call completes successfully',
//         () async {
//       final client = MockClient();
//
//       // Use Mockito to return a successful response when it calls the
//       // provided http.Client.
//       when(client.get(Uri.parse(
//               'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=ZyV009QDRHHBnUiYevAC4NbfchYBAbBf')))
//           .thenAnswer((_) async => http.Response('', 200));
//
//       expect(await getArticles(), isA<List<ArticleObject>?>());
//     });
//
//     test('throws an exception if the http call completes with an error', () {
//       final client = MockClient();
//
//       // Use Mockito to return an unsuccessful response when it calls the
//       // provided http.Client.
//       when(client.get(Uri.parse(
//               'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=ZyV009QDRHHBnUiYevAC4NbfchYBAbBf')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       expect(getArticles(), throwsException);
//     });
//   });
// }
