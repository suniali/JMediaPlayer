import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return conterollerAllPage();
  }

  Widget conterollerAllPage() {
    if (demoPlaylist.songs.length > 0) {
      return AllList();
    } else {
      return Center(
        child: Text(
          "All List was empty!",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      );
    }
  }
}

class AllList extends StatelessWidget {
  const AllList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: demoPlaylist.songs.length,
      addAutomaticKeepAlives: true,
      itemBuilder: (BuildContext cotext, int index) {
        return ListTile(
          leading: CircleAvatar(
              child: Image.network(demoPlaylist.songs[index].albumArtUrl)),
          title: Text(
            demoPlaylist.songs[index].songTitle,
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
