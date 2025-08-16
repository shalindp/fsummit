import 'package:flutter/material.dart';

class MatchIcon extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width*0.2533209,size.height*0.5702125);
path_0.cubicTo(size.width*0.1655684,size.height*0.5026031,size.width*0.06250000,size.height*0.4231937,size.width*0.06250000,size.height*0.2855344);
path_0.cubicTo(size.width*0.06250000,size.height*0.1335675,size.width*0.2343800,size.height*0.02579575,size.width*0.3750000,size.height*0.1718947);
path_0.lineTo(size.width*0.4375000,size.height*0.2343525);
path_0.cubicTo(size.width*0.4466531,size.height*0.2435037,size.width*0.4614937,size.height*0.2435009,size.width*0.4706469,size.height*0.2343463);
path_0.cubicTo(size.width*0.4797969,size.height*0.2251919,size.width*0.4797938,size.height*0.2103522,size.width*0.4706406,size.height*0.2012009);
path_0.lineTo(size.width*0.4102656,size.height*0.1408475);
path_0.cubicTo(size.width*0.5427656,size.height*0.04384656,size.width*0.6875000,size.height*0.1460828,size.width*0.6875000,size.height*0.2855344);
path_0.cubicTo(size.width*0.6875000,size.height*0.4231937,size.width*0.5844312,size.height*0.5026031,size.width*0.4966781,size.height*0.5702125);
path_0.cubicTo(size.width*0.4875594,size.height*0.5772406,size.width*0.4786031,size.height*0.5841406,size.width*0.4699469,size.height*0.5909656);
path_0.cubicTo(size.width*0.4375000,size.height*0.6165437,size.width*0.4062500,size.height*0.6406250,size.width*0.3750000,size.height*0.6406250);
path_0.cubicTo(size.width*0.3437500,size.height*0.6406250,size.width*0.3125000,size.height*0.6165437,size.width*0.2800541,size.height*0.5909656);
path_0.cubicTo(size.width*0.2713972,size.height*0.5841406,size.width*0.2624419,size.height*0.5772406,size.width*0.2533209,size.height*0.5702125);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}