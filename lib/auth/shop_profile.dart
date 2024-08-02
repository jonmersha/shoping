//On succefull logon to the using
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/components/text_form_field.dart';
import 'package:shop/components/text_widget.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/utils/app_constants.dart';

class Profile extends StatefulWidget {
  final AsyncSnapshot<User?> data;

  const Profile({super.key, required this.data});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _fullNameController.text = widget.data.data!.displayName.toString();
    _phoneNumberController.text = widget.data.data!.phoneNumber.toString();

    //1-checking the users for users on shopping system
    //2-if users are there proceed to the applications path
    //if the users are not there provide the users to
    //create profile as customer or merchant
    //load selected profile and and proceed normal operations

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                      '${widget.data.data!.photoURL.toString()}',
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    labelText(
                        label: 'Email',
                        text: '   ${widget.data.data!.email.toString()}'),
                    buildTextFormFieldText(
                        _fullNameController, 'Full Name', 'Edit Full Name'),
                    buildTextFormFieldNumber(_phoneNumberController, 'Phone',
                        'add/edit phone number'),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            navigateTo();
                          },
                            child: buildButton('Skip this Step')),
                        InkWell(
                            onTap: (){},
                            child: buildButton('Create My profile'))
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildButton(String label) {
    return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        //height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(label,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                      );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
  }

  void sendCreate() {
    final Map<String, dynamic> data = {
      "user_email": widget.data.data!.email.toString(),
      "phone": _phoneNumberController.text,
      "full_name": _fullNameController.text,
      "user_type":"merchant",
      "uid": widget.data.data!.uid.toString(),
    };

    Get.find<UserController>().addData('$ADD/4', data);
    //navigateTo();
    //listen for the response
    //request user id by email
    //update the users Id in common
    //navigate to where you want to be  merchant or customer

  }

    void sendSkip() {
      final Map<String, dynamic> data = {
        "email": widget.data.data!.email.toString(),
        "phone": widget.data.data!.phoneNumber.toString(),
        "full_name": widget.data.data!.displayName.toString(),
        "uid": widget.data.data!.uid.toString(),
      };

    Get.find<UserController>().addData('$ADD/4', data);
    navigateTo();
  }

  //Skip and loading the customer page
  void skip() {

  }

  //goto home page of respective users based on the users type
  void goHome(String userType) {
    // load merchant page or customer page
  }
  navigateTo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  Home(snapshot:widget.data),
      ),
    );
  }
}
