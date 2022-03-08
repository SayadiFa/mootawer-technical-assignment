import 'package:flutter/material.dart';
import 'package:mootawer_technical_test/controllers/most_viewed_get_api.dart';
import 'package:mootawer_technical_test/models/article_home_screen_object.dart';
import 'package:mootawer_technical_test/screens/article_details.dart';
import 'package:mootawer_technical_test/widgets/app_bar.dart';
import 'package:mootawer_technical_test/widgets/article_card.dart';
import 'package:mootawer_technical_test/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleObject>? articles;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getArticles().then((value) => {
          setState(() {
            articles = value;
            loading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, true),
      drawer: const AppDrawer(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: articles == null
                    ? Container(
                        child: const Text("Something went wrong!"),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:const EdgeInsets.only(top: 8,),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ArticleDetails(
                                                      articleObject:
                                                          articles![index])));
                                    },
                                    child: ArticleCard(
                                        articleObject: articles![index]));
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
    );
  }
}
