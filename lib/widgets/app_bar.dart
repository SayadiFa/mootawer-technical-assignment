import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


PreferredSizeWidget? customAppBar(context , bool inHomePage) {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }
  return PreferredSize(
    preferredSize: Size(double.infinity, 60),
    child: AppBar(
      centerTitle: inHomePage ? false: true,
      iconTheme: Theme.of(context).iconTheme,
      actions: [
        if(inHomePage)
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        if(inHomePage)
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Close App'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: InkWell(child: Text(choice), onTap: (){SystemNavigator.pop();},),
              );
            }).toList();
          },
        ),
      ],
      title: Text(
        'NY Times Most Popular',
      ),
    ),
  );
}