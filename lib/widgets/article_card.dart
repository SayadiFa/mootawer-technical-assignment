import 'package:flutter/material.dart';
import 'package:mootawer_technical_test/models/article_home_screen_object.dart';
import 'package:community_material_icon/community_material_icon.dart';


class ArticleCard extends StatelessWidget {
  final ArticleObject articleObject;
  const ArticleCard({Key? key,required this.articleObject}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var mdw = MediaQuery.of(context).size.width;




    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Circular image
          Hero(tag: 'heroTag${this.articleObject.id}',
            child: this.articleObject.imagesList.isEmpty ?
            Container(
                width: mdw*0.15,
                height: mdw*0.15,
                decoration: new BoxDecoration(
                    color: Theme.of(context).primaryTextTheme.headline4!.color,
                    shape: BoxShape.circle,
                ))
                : Container(
                width: mdw*0.15,
                height: mdw*0.15,
                decoration: new BoxDecoration(
                    color: Theme.of(context).primaryTextTheme.headline4!.color,
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:new NetworkImage(
                            this.articleObject.imagesList[0])
                    )
                )),
          ),
          //article title and writer
          Container(
            width: mdw*0.65,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.articleObject.title+this.articleObject.title, style: Theme.of(context).primaryTextTheme.headline5,maxLines: 2,overflow: TextOverflow.ellipsis,),
                // Text(this.articleObject.writer+this.articleObject.writer, style: Theme.of(context).primaryTextTheme.headline4,),
               Stack(children: [
                 buildText(this.articleObject.writer, Theme.of(context).primaryTextTheme.headline4!, '            \u202F', context),
                 Positioned.fill(
                   child: Align(alignment: Alignment.bottomRight, child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Icon(CommunityMaterialIcons.calendar_outline, color: Theme.of(context).primaryTextTheme.headline4!.color,),
                       Text("15-5-2021", style: Theme.of(context).primaryTextTheme.headline4,),
                     ],
                   )),
                 ),
               ],)



              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios_outlined,color: Theme.of(context).primaryIconTheme.color,)
        ],
      ),
    );
  }
}

//this widget places the date on the same line of writer's name if possible
Widget buildText(String text, TextStyle style, String reserve, context){
  return Container(
    constraints: BoxConstraints(
      minWidth: MediaQuery.of(context).size.width*0.65,
    ),
    child: LayoutBuilder(
      builder: (_, constraints) {
        final originalPainter = TextPainter(
          text: TextSpan(text: text, style: style ),
          textDirection: TextDirection.ltr,
          textWidthBasis: TextWidthBasis.longestLine,
        )..layout(maxWidth: constraints.maxWidth);

        final reservePainter = TextPainter(
          text: TextSpan(
              text: text + reserve, style: style),
          textDirection: TextDirection.ltr,
          textWidthBasis: TextWidthBasis.longestLine,
        )..layout(maxWidth: constraints.maxWidth);

        final changeLine =
            reservePainter.width > originalPainter.width + 0.001 ||
                reservePainter.height > originalPainter.height + 0.001;

        return Text(
          changeLine ? text + '\n' : text,
          style: style,

        );
      },
    ),
  );
}