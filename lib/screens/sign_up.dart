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
                Text('SignUp',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40.0),),
                Column(
                  children: [
                    textFeild(hinText: 'Name'),
                    textFeild(hinText: 'UserName'),
                    textFeild(hinText: 'Password'),
                    textFeild(hinText: 'Confirm Password'),
                  ],
                ),
              Row(
                children: [
                  Container(
                    width:50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            // side: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                     onPressed: (){

                     }, child: Text(''),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
