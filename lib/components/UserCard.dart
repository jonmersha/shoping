import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  final  user;
  const UserView({super.key, required this.user});
  @override
  _UserViewState createState() => _UserViewState();
}
class _UserViewState extends State<UserView> {
  void _increaseProgress() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Text(widget.user.userEmail,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
             Text(
               widget.user.fullName,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     const SizedBox(width: 8.0),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
