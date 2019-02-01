import 'package:flutter/material.dart';
import 'package:jmedia_player/component/album_page.dart';
import 'package:jmedia_player/component/offline_page.dart';
import 'package:jmedia_player/component/play_now.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(text: "Offline", icon: Icon(Icons.offline_bolt)),
    Tab(text: "Album", icon: Icon(Icons.album)),
    Tab(text: "All", icon: Icon(Icons.all_inclusive)),
    Tab(text: "favarits", icon: Icon(Icons.favorite)),
  ];
  List<Widget> pagerWidget = [];
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
    pagerWidget.add(OfflinePage());
    pagerWidget.add(AlbumPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
        ),
      ),
      drawer: Drawer(),
      //     body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       SliverAppBar(
      //         expandedHeight: 100.0,
      //         backgroundColor: Colors.black87,
      //         pinned: false,
      //         flexibleSpace: FlexibleSpaceBar(
      //           //background
      //         ),
      //       )
      //     ];
      //   },
      //   body: Container(
      //     color: Colors.black54,
      //     child: PlayNow(),
      //   ),
      // )
      body: TabBarView(
        controller: tabController,
        children: pagerWidget,
      ),
    );
  }
}
