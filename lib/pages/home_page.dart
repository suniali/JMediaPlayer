import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:jmedia_player/component/controller_play_now.dart';
import 'package:jmedia_player/component/play_now.dart';
import 'package:jmedia_player/component/songs.dart';
import 'package:jmedia_player/pages/tabs/album_page.dart';
import 'package:jmedia_player/pages/tabs/all_page.dart';
import 'package:jmedia_player/pages/tabs/favarite_page.dart';
import 'package:jmedia_player/pages/tabs/offline_page.dart';
import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  int positionSong = 0;
  String _currectStateSheet="initial";
  String _directionSheet="up";
  bool isActivedSheet=false;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  AudioPlayer player = AudioPlayer();
  List<Tab> tabs = [
    Tab(text: "favarits", icon: Icon(Icons.favorite)),
    Tab(text: "Offline", icon: Icon(Icons.offline_bolt)),
    Tab(text: "Album", icon: Icon(Icons.album)),
    Tab(text: "All", icon: Icon(Icons.all_inclusive)),
  ];
  List<Widget> pagerWidget = [];
  TabController tabController;

  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
    pagerWidget.add(FaveritePage());
    pagerWidget.add(OfflinePage());
    pagerWidget.add(AlbumPage());
    pagerWidget.add(AllPage());

    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          
        ],
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
  void _showBottomSheet(BuildContext context)
  {
    showBottomSheet<void>(context: context , builder: _bottomSheetBuilder)
    .closed
    .whenComplete((){
      if(mounted)
      {
        setState(() {
         widget.isActivedSheet=false; 
        });
      }
    });
  }
  Widget _bottomSheetBuilder(BuildContext context){
    final key=GlobalKey<ScrollableBottomSheetState>();
    return Stack(
      children: <Widget>[
        ScrollableBottomSheet(
          key: key,
          autoPop: false,
          snapAbove: true,
          snapBelow: true,
          halfHeight: 500.0,
          minimumHeight: 50.0,
          scrollTo: ScrollState.minimum,
          callback: (state)
          {
            if(state==ScrollState.minimum)
            {
              widget._currectStateSheet="minimum";
              widget._directionSheet="up";
            }else if(state==ScrollState.half)
            {
              if(widget._currectStateSheet=="minimum")
              {
                widget._directionSheet="up";
              }else{
                widget._directionSheet="down";
              }
            }else
            {
              widget._currectStateSheet="full";
              widget._directionSheet="down";
            }
          },
          child: PlayNow(player)
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          height: 50.0,
          child: Material(
            child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 50.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListTile(
                    title: Text(demoPlaylist.songs[widget.positionSong].songTitle),
                    subtitle: Text(demoPlaylist.songs[widget.positionSong].artist),
                  ),
                  ControllerPlayNow(),
                ],
              ),
              onTap: key.currentState.animateToFull(context),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
