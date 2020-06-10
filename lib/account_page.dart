import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final String url = 'https://w.namu.la/s/3caf0a6b6dac8e8c7e1efcbf8b29e85178312a198d06ba3c1b7e47b04541aeeab2fa1480dea9963e3ae4fbf745a5dbb5814f4b92d02534b1b60230c7c3be19f2c4787d759b4f3d5bb86bdbfa3d8b0b0c35e385e517c3fbac43c3de6d0d78ca73';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoUrl),
                  )
                ),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                          width: 28, height: 28,
                          child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.add)
                          ),
                      ),
                      SizedBox(
                        width: 25, height: 25,
                        child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add)
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
            Text(widget.user.displayName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ,),
            Padding(padding: EdgeInsets.all(8))
          ],),
          Text('0\n게시물',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          Text('0\n팔로워', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          Text('0\n팔로잉', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))
        ],
    )
    );
  }
}
