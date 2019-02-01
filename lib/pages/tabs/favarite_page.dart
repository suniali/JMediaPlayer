import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';

class FaveritePage extends StatefulWidget {
  @override
  _FaveritePageState createState() => _FaveritePageState();
}

class _FaveritePageState extends State<FaveritePage> {
  List<FaveriteModel> faveriteList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findArtists();
  }

  @override
  Widget build(BuildContext context) {
    return controllerFaveritePage();
  }

  Widget controllerFaveritePage() {
    if (faveriteList.length > 0) {
      return ListFaverite(faveriteList: faveriteList);
    } else {
      return Center(
        child: Text(
          "List of Faverite was empty!",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      );
    }
  }

  void findArtists() {
    // for (int i = 0; i < demoPlaylist.songs.length; i++) {
    //   FaveriteModel faveriteModel = FaveriteModel();
    //   faveriteModel.title = demoPlaylist.songs[i].songTitle;
    //   faveriteModel.artist = demoPlaylist.songs[i].artist;
    //   faveriteModel.coverUrl = demoPlaylist.songs[i].albumArtUrl;
    //   faveriteModel.songUrl=demoPlaylist.songs[i].audioUrl;
    //   faveriteList.add(faveriteModel);
    // }
  }
}

class ListFaverite extends StatelessWidget {
  const ListFaverite({
    Key key,
    @required this.faveriteList,
  }) : super(key: key);

  final List<FaveriteModel> faveriteList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: faveriteList.length,
      itemBuilder: (BuildContext cotext, int index) {
        return ListTile(
          leading: CircleAvatar(child: Image.network(faveriteList[index].coverUrl),),
          title: Text(
            faveriteList[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(faveriteList[index].artist),
          contentPadding: EdgeInsetsDirectional.only(start: 8.0),
        );
      },
    );
  }
}

class FaveriteModel {
  String title;
  String coverUrl;
  String artist;
  String songUrl;
  FaveriteModel({this.title, this.artist, this.coverUrl,this.songUrl});
}
