import 'dart:convert';
import 'dart:io';

import 'package:Play_Android/VanAndroid/Banner/Banner.dart';
import 'package:Play_Android/VanAndroid/Silder/VanDrawer.dart';
import 'package:flutter/material.dart';

class VanHomePage extends StatefulWidget{

  VanHomePage({Key key,this.title}):super(key:key);

  final String title;

  @override
  State<VanHomePage> createState() => new VanHomePageState();
}

class VanHomePageState extends State<VanHomePage>{

  final httpClient = new HttpClient();
  final bannerUrl = "http://www.wanandroid.com/banner/json";
  var banner;

  void _bulidBannerImage() async {
    //print('Response=进入');
    List data = new List();

    try{
      //print('Response=进入');
      var request = await httpClient.getUrl(Uri.parse(bannerUrl));
      var response = await request.close();

      if(response.statusCode==HttpStatus.OK){
        var responseBody = await response.transform(utf8.decoder).join();
        var res = json.decode(responseBody);
        data = res['data'];
        //print('Response=$data');
      }
    }
    catch (exception){
      print('Exception=$exception');
    }

    //update bannerImages value
    setState((){
      banner = data;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bulidBannerImage();
  }

  @override
  Widget build(BuildContext context) {

    _bulidBannerImage();

    return new MaterialApp(
      title: widget.title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title)
        ),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new BannerPage(banners: banner,)
            ],
          ),
        ),
        drawer: new VanDrawerPage(accountEmail: "891532752@qq.com",
            accountName: "SmileSB101",
            userAvator: "assets/imgs/avator.jpg"),
      ),
    );
  }

}