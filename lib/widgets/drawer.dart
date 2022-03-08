import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var mdh = MediaQuery.of(context).size.height;
    return Container(
      width: mdw*0.75,
      color: Theme.of(context).primaryColor,
      child: Center(
        child:InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row
            (mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home,size: mdh*0.07),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Home Page', style: Theme.of(context).primaryTextTheme.headline6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
