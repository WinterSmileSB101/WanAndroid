import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget{
  const BannerItem({this.banner});

  final List banner;

  //final List<String> bannerImages;
  //final List<String> bannerTitles;
  //final List<String> bannerUrls;

  void _handleArrowButtonPress(BuildContext context,int delta){
    final TabController controller = DefaultTabController.of(context);
    if(!controller.indexIsChanging){
      controller.animateTo((controller.index+delta).clamp(0, banner.length-1));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;

    return new SafeArea(
      top: false,
        bottom: false,
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: new Row(
                children: <Widget>[
                  new IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: color,
                    onPressed: (){_handleArrowButtonPress(context, -1);},
                    tooltip: 'Page back',),
                  new TabPageSelector(controller: controller,),
                  new IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: (){_handleArrowButtonPress(context, 1);},
                    tooltip: 'Page forward',),],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
        new Expanded(
        child: new IconTheme(
        data: new IconThemeData(size: 128.0,color: color),
        child: new TabBarView(
    children: banner.map((banner){
      //print(banner['imagePath']);
      return new Container(
      padding: const EdgeInsets.all(12.0),
    child: new Card(
      child: new Column(
        children: <Widget>[
          new Image.network(banner['imagePath'])
        ],
      ),
    ),
      );}).toList())
    )
    ),
    ]
    )
    );
  }

}

class BannerPage extends StatelessWidget{
  BannerPage({this.banners});
  final List banners;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //print("Banner 页面");
    //print('Banner 页面=$banners');
    return new DefaultTabController(
        length: banners==null?0:banners.length,
        child: banners==null?new Text("里面什么都没有呢。。。。。。。。"):new BannerItem(banner: this.banners),
    );
  }
}