import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: (){

            }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),

      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(

            ),
          ),
          Expanded(
            flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff3a3e3e),
                  borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(10.0),
                     topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text("Neapolitan",style: TextStyle(fontSize: 40.0,color: Colors.white),),
                      Text('Any text...',style: TextStyle(fontSize: 7.0,color: Colors.white),),
                      SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10.0,),
                            Text('1',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10.0,),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        Text("\$150",style: TextStyle(color: Colors.white,fontSize: 30.0),),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Text("Descriptio",style: TextStyle(fontSize: 25.0,color: Colors.white),),
                    Text('User will get details of restaurants like name, location and reviews. Users can select the food from the menu list, can add to favourites and can get processed further. User can view the history of their orders and the current orders status. User have online payment options.',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 55.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            primary: Colors.purple
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.shop,color: Colors.white,),
                            Text(
                              "Add To Cart",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
