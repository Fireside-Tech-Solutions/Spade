import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spades/routing/router.dart';
import 'package:spades/services/firebase_auth_service.dart';
import 'package:spades/common_widgets/avatar.dart';
import 'package:spades/common_widgets/avatar_stacked.dart';

class LandingPage extends StatelessWidget {
  
@override
  Widget build(BuildContext context) {
    //Must remove later now for testing to test profile image that dont work
    final user = Provider.of<User>(context);
    return  Scaffold( 
      appBar: AppBar( 
        backgroundColor: Color(0xFF2430346),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Avatar(
                        photoUrl: user.photoUrl,
                        radius: 40,
                        borderColor: Colors.black54,
                        borderWidth: 2.0,
                      ),
                      Text(
                        "@username",
                        style: new TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )
                      )
                    ],
                  ),
                ),
              ),
               Expanded(
                  child:Padding(
                padding: const EdgeInsets.only(right:70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "My Partner",
                      style: new TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ), 
                    ),
                    Text(
                      "Dorian",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "@Doetheman",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "128 Games Played",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "117 Wins",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
        Text("Start Team Match"),
        SizedBox(
          height: 200,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StackedAvatar( photoUrl: user.photoUrl, radius: 20 ),
                Text("Dorian + Jadi"),
                Text("10 wins"),
              ],
            ),
          ),
          ),
        ),
        FlatButton(onPressed: null, child: Text("Learn"))
       ],
      ),
    );
  }
}