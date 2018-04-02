import 'package:flutter/material.dart';

class VanDrawerPage extends StatefulWidget{

  VanDrawerPage({Key key,this.accountName,this.accountEmail,this.userAvator}):super(key:key);

  final String accountName;
  final String accountEmail;
  final String userAvator;

  @override
  State<VanDrawerPage> createState() => new VanDrawerPageState();
}

class VanDrawerPageState extends State<VanDrawerPage>{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(widget.accountName),
            accountEmail: new Text(widget.accountEmail),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage(widget.userAvator),
          ),
          onDetailsPressed: (){},),
          new ClipRect(
            child: new ListTile(
              title: new Text("A"),
              subtitle: new Text("A-B"),
              isThreeLine: true,
            ),
          )
        ],

      ),
    );
  }
}