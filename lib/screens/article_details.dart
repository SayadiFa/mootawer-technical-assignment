import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mootawer_technical_test/app_theme.dart';
import 'package:mootawer_technical_test/models/article_home_screen_object.dart';
import 'package:mootawer_technical_test/widgets/app_bar.dart';
import 'package:mootawer_technical_test/widgets/article_card.dart';
// import 'package:url_launcher/url_launcher.dart';


class ArticleDetails extends StatefulWidget {
  final ArticleObject articleObject;

  const ArticleDetails({Key? key, required this.articleObject})
      : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {


  List<String> imagesList = [];

  @override
  Widget build(BuildContext context) {
    imagesList = widget.articleObject.imagesList;

    var mdw = MediaQuery
        .of(context)
        .size
        .width;
    var mdh = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: customAppBar(context, false),
      body: Column(
        children: [
          if(widget.articleObject.imagesList.isNotEmpty)
           Stack(
            children: [
              //Image Slider Widget
              Hero(
                tag: 'heroTag${this.widget.articleObject.id}',
                child: Container(
                    height: mdh * 0.3,
                    width: mdw,
                    child: Image.network(
                      widget.articleObject.imagesList[imagesList.length - 1],
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.appPrimaryColor,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    )),
              ),

              //A shadow at the bottom of the image
              if (widget.articleObject.caption != '')
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: mdw,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.8),
                            ])),
                    child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text(
                        widget.articleObject.caption ?? '',
                        style: Theme
                            .of(context)
                            .primaryTextTheme
                            .headline3,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ),
                  ),
                ),
            ],
          ),
          Container(
            // width: mdw * 1,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.articleObject.title,
                  style: Theme
                      .of(context)
                      .primaryTextTheme
                      .headline1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.articleObject.abstract,
                    style: Theme
                        .of(context)
                        .primaryTextTheme
                        .headline5,
                  ),
                ),
                Stack(
                  children: [
                    buildText(
                        widget.articleObject.writer,
                        Theme
                            .of(context)
                            .primaryTextTheme
                            .headline4!,
                        '            \u202F',
                        context),
                    Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                CommunityMaterialIcons.calendar_outline,
                                color: Theme
                                    .of(context)
                                    .primaryTextTheme
                                    .headline4!
                                    .color,
                              ),
                              Text(
                                "15-5-2021",
                                style: Theme
                                    .of(context)
                                    .primaryTextTheme
                                    .headline4,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Center(child: Container(padding:EdgeInsets.symmetric(vertical: 25),
                  child: InkWell(
                      onTap: (){
                        // _launchURL() async {
                        //   String url = widget.articleObject.articleLink;
                        //   if (await canLaunch(url)) {
                        //     await launch(url);
                        //   } else {
                        //   throw "Could not launch link";
                        // }
                        // }
                      },
                      child: Text('View Full Article', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 17),))

                  ,),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
