import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<AlbumModel> albumList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findArtists();
  }

  @override
  Widget build(BuildContext context) {
    return controllerAlbumPage();
  }

  Widget controllerAlbumPage() {
    if (albumList.length > 0) {
      return ListAlbum(albumList: albumList);
    } else {
      return Center(
        child: Text(
          "List of Album was empty!",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      );
    }
  }

  void findArtists() {
    bool isExist=false;
    demoPlaylist.songs.forEach((item){
      albumList.forEach((item1){
        if(item1.artist==item.artist)
        {
          isExist=true;
          return;
        }
      });
       if(isExist==false)
      {
         AlbumModel albumModel = AlbumModel();
          albumModel.title = item.songTitle;
          albumModel.artist = item.artist;
          albumModel.coverUrl = item.albumArtUrl;
          albumList.add(albumModel);
          isExist=false;
      }
    });
  }
}

class ListAlbum extends StatelessWidget {
  const ListAlbum({
    Key key,
    @required this.albumList,
  }) : super(key: key);

  final List<AlbumModel> albumList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: albumList.length,
      itemBuilder: (BuildContext cotext, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Image.network(albumList[index].coverUrl),
          ),
          title: Text(
            albumList[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(albumList[index].artist),
          contentPadding: EdgeInsetsDirectional.only(start: 8.0),
        );
      },
    );
  }
}

class AlbumModel {
  String title;
  String coverUrl;
  String artist;
  AlbumModel({this.title, this.artist, this.coverUrl});
}
