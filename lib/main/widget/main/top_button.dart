import 'package:shop/main/widget/flexible_button.dart';
import 'package:flutter/material.dart';

class TopButtonContainer extends StatelessWidget {
  const TopButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //  color: Colors.blue[500],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlexibleButton(
                iconColor: Colors.blue,
                icon: Icons.note,
                labelText: '',
                backGround: Colors.white,
                width: 70,
              ),
              FlexibleButton(
                iconColor: Colors.red,
                icon: Icons.video_collection,
                labelText: '',
                backGround: Colors.white,
                width: 70,
              ),
              FlexibleButton(
                iconColor: Colors.blue,
                icon: Icons.list,
                labelText: '',
                backGround: Colors.white,
                width: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
