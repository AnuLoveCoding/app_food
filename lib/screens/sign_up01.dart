import 'package:app_food/screens/widget/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late UserCredential userCredential;

  bool loading = false;

  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Confirm_password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
       userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email.text,
          password: Password.text,
      );
      await FirebaseFirestore.instance.collection('userData').doc(userCredential.user?.uid).set({
        'UserName': UserName,
        'Password' : Password,
        'userid' : userCredential.user?.uid,
        'Email': Email,
        'Confirm_password': Confirm_password,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).
        showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).
        showSnackBar(
          const SnackBar(content: Text('The account  already exist for that Email.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).
      showSnackBar(
         SnackBar(content: Text('$e'),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void validation(){
    if(UserName.text.trim().isEmpty || UserName.text.trim() == null){
       ScaffoldMessenger.of(context).
            showSnackBar(
              const SnackBar(content: Text('UserName is empty'),
            ),
       );
       return;
    }

    if(Email.text.trim().isEmpty || Email.text.trim() == null){
      ScaffoldMessenger.of(context).
      showSnackBar(
        const SnackBar(content: Text('Email is empty'),
        ),
      );
      return;
    }

    if(Confirm_password.text.trim().isEmpty || Confirm_password.text.trim() == null){
      ScaffoldMessenger.of(context).
      showSnackBar(
        const SnackBar(content: Text('Confirm_password is empty'),
        ),
      );
      return;
    }

    if(Password.text.trim().isEmpty || Password.text.trim() == null){
      ScaffoldMessenger.of(context).
      showSnackBar(
        const SnackBar(content: Text('Passwprd is empty'),
        ),
      );
      return;
    }
    else{
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  Widget button({required String buttonName, required Color color, required Color textcolor, required Function ontap}){
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
        ), child: Text(buttonName,style: TextStyle(fontSize:20.0,color: textcolor ),),
        onPressed: ontap(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
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
                    MyTextFeild(hintText: 'UserName', obscureText: false, controller: UserName,),
                    MyTextFeild(hintText: 'Password', obscureText: true, controller: Password,),
                    MyTextFeild(hintText: 'Email', obscureText: false, controller: Email,),
                    MyTextFeild(hintText: 'Confirm_password', obscureText: true, controller: Confirm_password,)
                  ],
                ),
              ),
              loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  ],
              ): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(buttonName: 'Cancel', color: Colors.grey, textcolor: Colors.white, ontap: (){}),
                  SizedBox(width: 10.0,),
                  button(buttonName: 'Register', color: Colors.red, textcolor: Colors.white, ontap: (){
                    return validation();
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
