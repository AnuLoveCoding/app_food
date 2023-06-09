import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {



  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20.0,left: 10.0,right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 65.0,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(image: AssetImage('../'))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text('\$23',style: TextStyle(color: Colors.white,fontSize: 30.0),),
              Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(onPressed: (){

          }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.white,),
      ),
      body: Column(
        children: [
          Row(
            children: [
                Container(
                  width: 170.0,
                  height: 10.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('../images/piazza01.jpg'),
                  ),
                ),
              SizedBox(width: 20.0,),
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Burger',style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),),
                          Text('burger bhout acha hai',style: TextStyle(color: Colors.white,fontSize: 10.0),),
                          Text('\$\$70',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              IconButton(onPressed: (){

                               }, icon: Icon(Icons.remove,color: Colors.white,size: 50.0,),),
                              SizedBox(width: 10.0,),
                              Text('1',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                              SizedBox(width: 10.0,),
                              IconButton(onPressed: (){

                               }, icon: Icon(Icons.add,color: Colors.white,size: 50.0,),),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Colors.white,size: 10.0,))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
