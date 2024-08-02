import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
final String fullName;
final imageUrl;
  const HeaderSection({super.key, required  this.fullName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:  BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
            left: BorderSide(color: Colors.grey.shade400),
            right: BorderSide(color: Colors.grey.shade400),

          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const Icon(Icons.arrow_back),
        Text('WellCome  $fullName'),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image:  NetworkImage(imageUrl)),

              )
          ),
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

      ],),
    );
  }
}
