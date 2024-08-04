//On succefull logon to the using
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/auth/check_user.dart';
import 'package:shop/auth/profile_creation_response.dart';
import 'package:shop/components/text_form_field.dart';
import 'package:shop/components/text_widget.dart';
import 'package:shop/utils/app_constants.dart';

/*
* Before coming to this sections in auth screen the
*   Search The users using email in the database
*     if exist add the id to id holder and navigate to the Home screen */

class Profile extends StatefulWidget {
  final User? user;

  const Profile({super.key, required  this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _fullNameController.text = widget.user!.displayName.toString();
    String phone=widget.user!.phoneNumber.toString();
    if(phone!='null'){
      _phoneNumberController.text=widget.user!.phoneNumber.toString();
    }


    //1-checking the users for users on shopping system
    //2-if users are there proceed to the applications path
    //if the users are not there provide the users to
    //create profile as customer or merchant
    //load selected profile and and proceed normal operations

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                      widget.user!.photoURL.toString(),
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    labelText(
                        label: 'Email',
                        text: '   ${widget.user!.email.toString()}'),
                    buildTextFormFieldText(
                        _fullNameController, 'Full Name', 'Edit Full Name'),
                    buildTextFormFieldNumber(_phoneNumberController, 'Phone',
                        'add/edit phone number'),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            createCustomer();
                          },
                            child: buildButton('Continue as Customer')),
                        const SizedBox(height: 20,),
                        InkWell(
                            onTap: (){
                              createMerchant();
                            },
                            child: buildButton('Continue as Seller'))
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
                        padding: const EdgeInsets.all(15),
                        //height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(label,style: const TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                      );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void createMerchant() {
    final Map<String, dynamic> data = {
      "user_email": widget.user!.email.toString(),
      "phone": _phoneNumberController.text,
      "full_name": _fullNameController.text,
      "user_type":0,
      "uid": widget.user!.uid.toString(),
    };

    //Get.find<UserController>().addData('$ADD/5', data);
    //navigateTo();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileCreationResponse(path: '$ADD/5',data:data, message: 'Your Profile Has Ben Created successfully !!'),
      ),
    );

    //listen for the response
    //request user id by email
    //update the users Id in common
    //navigate to where you want to be  merchant or customer

  }

    void createCustomer() {
      final Map<String, dynamic> data = {
        "user_email": widget.user!.email.toString(),
        "phone": _phoneNumberController.text,
        "full_name": widget.user!.displayName.toString(),
        "user_type":1,
        "uid": widget.user!.uid.toString(),
      };
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileCreationResponse(path: '$ADD/5',data:data, message: 'Your Profile Has Ben Created successfully !!'),
        ),
      );

    // Get.find<UserController>().addData('$ADD/5', data);
    // navigateTo();
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
        builder: (context) =>  CheckUser(user:widget.user),
      ),
    );
  }
}
