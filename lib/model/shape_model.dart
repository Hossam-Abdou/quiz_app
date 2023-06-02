
import 'package:flutter/cupertino.dart';

class Mycl extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width*0.3350000,size.height*0.6385714);
    path0.lineTo(size.width*0.6633333,size.height*0.6371429);
    path0.lineTo(size.width*0.7058333,size.height*0.3557143);
    path0.lineTo(size.width*0.4975000,size.height*0.2142857);
    path0.lineTo(size.width*0.2908333,size.height*0.3571429);
    path0.lineTo(size.width*0.3350000,size.height*0.6385714);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>true;

}