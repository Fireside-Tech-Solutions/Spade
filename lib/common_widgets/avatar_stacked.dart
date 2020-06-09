import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spades/common_widgets/avatar.dart';

class StackedAvatar extends StatelessWidget {
  const StackedAvatar({
    @required this.photoUrl,
    @required this.radius,
    this.borderColor,
    this.borderWidth,
  });
  final String photoUrl;
  final double radius;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 90,
        width: 90,
        child:Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 30,
          child: Avatar(
            photoUrl: photoUrl, 
            radius: 30,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Avatar(
          photoUrl: photoUrl, 
          radius: 30,
          ),
        ),
      ],
        ),
      ),
    );
  }
}
