import 'package:app_food/screens/widget/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  late UserCredential userCredential;
    var Name = TextEditingController();
    var  Username = TextEditingController();
    var password = TextEditingController();
    var Email = TextEditingController();
    var confirm_Password = TextEditingController();

  Future sendData() async {
    try {
      userCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email.text,
          password: password.text,
      );
      await FirebaseFirestore.instance.collection('userData').doc().set({
        'Name': Name.text,
        'Username' : Username.text,
        'password' : password.text,
        'Email' : Email.text,
        'cofirm_password' : confirm_Password.text,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  Widget button({required String buttonName, required Color color}){
    return Container(
      width:120.0,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              // side: BorderSide(color: Colors.red)
            ),
          ),
        ),
        onPressed: (){

        }, child: Text(buttonName,style: TextStyle(fontSize:20.0, ),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal:50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40.0),),
                Container(
                  height:300.0 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextFeild(hintText: "Name", obscureText: false),
                      MyTextFeild(hintText: 'UserName', obscureText: false),
                      MyTextFeild(hintText: 'Password', obscureText: true),
                      MyTextFeild(hintText: 'Email', obscureText: false),
                      MyTextFeild(hintText: 'Confirm Password', obscureText: true)
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    button(buttonName: 'Cancel', color: Colors.grey),
                    SizedBox(width: 10.0,),
                    button(buttonName: 'Register', color: Colors.red)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

