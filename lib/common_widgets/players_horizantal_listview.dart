import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spades/services/firebase_auth_service.dart';
import 'package:spades/mockData/user.dart';
import 'avatar.dart';

class ProfileList extends StatelessWidget {
  final User user;
  ProfileList({this.user});
  @override
  Widget build(BuildContext context) {
    final partners = UserConnectionListData.partners;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Partners',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 180.0,
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: partners.length,
            itemBuilder: (BuildContext context, int index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Avatar(photoUrl: partners[index].profileImagePath, radius: 50),
                    Text(partners[index].name),
                    Text(partners[index].winPercentile.toString() + "% Wins"),
                  ],
                    ),
                ),
                ),
            ),
            Text(
            'Frequent Opponents',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 180.0,
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: partners.length,
            itemBuilder: (BuildContext context, int index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Avatar(photoUrl: partners[index].profileImagePath, radius: 50),
                    Text(partners[index].name),
                    Text(partners[index].winPercentile.toString() + "% Wins"),
                  ],
                    ),
                ),
                ),
            ),
          Text(
            "Billing and Subscription Plan",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            height: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Platinum Member"),
                Text("Your next billing data is June 2, 2020."),
                Text("Amex********9168"),
                FlatButton(
                  child: Text("Update Plan"),
                ),
              ],
            ),
          ),
          Center(
            child: FlatButton(
            child: Text("Report an issue"),
            ),
          ),
        ],
      ),
    );
  }
}
