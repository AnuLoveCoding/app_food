import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget button({required String name, required Color color}){
    return Container(
      height: 45.0,
      width: 300.0,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: color)
            ),
          ),
        ),
        onPressed: (){},
        child: Text(name,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Center(
                  child: Image(image: AssetImage('../images/deliver02.jpg'),
                  ),
                ),
            )
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text('Welcome To Tastee', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold, fontSize: 30.0),),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Text('Order food from our resturant and'),
                      Text('make reservation in real-time')
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  button(name: 'LoginPage', color: Colors.green),
                  SizedBox(height: 20.0,),
                  button(name :'SignUp', color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
