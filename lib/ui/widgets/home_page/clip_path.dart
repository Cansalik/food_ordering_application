import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';

class CustomClip extends StatefulWidget {
  const CustomClip({super.key});

  @override
  State<CustomClip> createState() => _CustomClipState();
}

class _CustomClipState extends State<CustomClip> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        width: width,
        height: height * 0.23,
        color: CustomColors.backColor,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("Merhaba, Neş-Et'e",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Hoşgeldiniz.",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(width: 90,),
                  Icon(Icons.account_circle,color: Colors.white,size: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
