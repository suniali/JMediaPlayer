import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';

class OfflinePage extends StatefulWidget {
  @override
  _OfflinePageState createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  List<OfflineModel> offlineList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return conterollerOfflinePage();
  }

  Widget conterollerOfflinePage() {
    if (offlineList.length > 0) {
      return OfflineList(offlineList: offlineList);
    } else {
      return Center(
        child: Text(
          "Offline List was empty!",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      );
    }
  }
}

class OfflineList extends StatelessWidget {
  const OfflineList({
    Key key,
    @required this.offlineList,
  }) : super(key: key);

  final List<OfflineModel> offlineList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: offlineList.length,
      itemBuilder: (BuildContext cotext, int index) {
        return ListTile(
          leading: Image.network(offlineList[index].coverUrl),
          title: Text(
            offlineList[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(demoPlaylist.songs[index].artist),
          contentPadding: EdgeInsetsDirectional.only(start: 8.0),
        );
      },
    );
  }
}

class OfflineModel {
  String title;
  String coverUrl;
  String artist;
  String songUrl;
  OfflineModel({this.title, this.artist, this.coverUrl, this.songUrl});
}
