import 'package:flutter/cupertino.dart';

class UserConnectionListData {
  String profileImagePath;
  String titleTxt;
  String username;
  String name;
  int wins;
  double winPercentile;

  UserConnectionListData ({
    this.profileImagePath = '',
    this.titleTxt = '',
    this.username = '',
    this.name = '',
    this.wins = 0,
    this.winPercentile = 0,
  });
  static List<UserConnectionListData> partners = [
    UserConnectionListData(
      profileImagePath: 'mockPhotos/jaelyn.jpg',
      titleTxt: 'Partner',
      username: 'jaedog',
      name: 'Jaelyn',
      wins: 1,
      winPercentile: 10,
    ),
  ];

  static List<UserConnectionListData> competitors = [
    UserConnectionListData(
      profileImagePath: 'mockPhotos/jaelyn.jpg',
      titleTxt: 'Enemy',
      username: 'dabbleGanger',
      name: 'Nemesis',
      wins: 1,
      winPercentile: 10,
    ),
  ];
}