import 'package:flutter/material.dart';
import 'package:instagramclone/create_page.dart';

final String url = 'https://w.namu.la/s/3caf0a6b6dac8e8c7e1efcbf8b29e85178312a198d06ba3c1b7e47b04541aeeab2fa1480dea9963e3ae4fbf745a5dbb5814f4b92d02534b1b60230c7c3be19f2c4787d759b4f3d5bb86bdbfa3d8b0b0c35e385e517c3fbac43c3de6d0d78ca73';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),

    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: 5,
        itemBuilder: (context, index){
          return _buildListItem(context, index);
        });

  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('$url', fit: BoxFit.cover,);
  }
}
