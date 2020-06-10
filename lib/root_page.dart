import 'package:flutter/material.dart';
import 'package:instagramclone/login_page.dart';
import 'package:instagramclone/root_page.dart';
import 'package:instagramclone/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        if(snapshot.hasData){
          return TabPage(snapshot.data);
        }else{
          return LoginPage();
        }

      },
    );
  }
}
