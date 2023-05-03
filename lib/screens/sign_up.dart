import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  Widget textFeild({required String hinText}){
    return TextField(
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(

          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
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
                      textFeild(hinText: 'Name'),
                      textFeild(hinText: 'UserName'),
                      textFeild(hinText: 'Password'),
                      textFeild(hinText: 'Confirm Password'),
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
