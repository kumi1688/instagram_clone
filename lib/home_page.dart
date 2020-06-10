import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final String url = 'https://w.namu.la/s/3caf0a6b6dac8e8c7e1efcbf8b29e85178312a198d06ba3c1b7e47b04541aeeab2fa1480dea9963e3ae4fbf745a5dbb5814f4b92d02534b1b60230c7c3be19f2c4787d759b4f3d5bb86bdbfa3d8b0b0c35e385e517c3fbac43c3de6d0d78ca73';
class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),),
      body: _buildBody() 
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  children: <Widget>[
                    Text('인스타 그램에 오신 걸 환영합니다', style: TextStyle(fontSize: 24)),
                    Padding(padding: EdgeInsets.all(8.0),),
                    Text('사진과 동영상을 보려면 클릭해주세요'),
                    Padding(padding: EdgeInsets.all(16.0),),
                    SizedBox(
                      width: 350.0,
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(8.0),),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8.0),),
                            Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.all(8.0),),
                            Text(user.displayName),
                            Padding(padding: EdgeInsets.all(8.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network('$url', fit: BoxFit.cover)
                                ),
                                Padding(padding: EdgeInsets.all(1.0),),
                                SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image.network('$url', fit: BoxFit.cover)
                                ),
                                Padding(padding: EdgeInsets.all(1.0),),
                                SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image.network('$url', fit: BoxFit.cover)
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(4.0),),
                            Text('페이스북 친구'),
                            Padding(padding: EdgeInsets.all(4.0),),
                            RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: (){},
                            ),
                            Padding(padding: EdgeInsets.all(4.0),),
                          ]
                        ),
                      ),
                    )

                  ]
              )
            )
          ),
        ),
    );

  }
}
