import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget categoriesContainer({required String image, required String name}){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        SizedBox(height: 10.0,),
        Text(name,style: TextStyle(fontSize: 20.0,color: Colors.white),)
      ],
    );
  }
  Widget bottomContainer({required String image, required int price, required String name}){
    return Container(
      height: 270.0,
      width: 220.0,
      decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(name,style: TextStyle(color: Colors.white),),
            trailing: Text('\$ $price',style: TextStyle(fontSize: 20.0,color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Icon(size:20.0,Icons.star,color: Colors.white,),
                Icon(size:20.0,Icons.star,color: Colors.white,),
                Icon(size:20.0,Icons.star,color: Colors.white,),
                Icon(size:20.0,Icons.star,color: Colors.white,),
                Icon(size:20.0,Icons.star,color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget drawerItem({required String name, required IconData icon}){
    return ListTile(
      leading: Icon(icon,color: Colors.white,),
      title: Text(name,style: TextStyle(fontSize: 20.0,color: Colors.white),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff3a3e3e),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('../images/background.jpg'),fit: BoxFit.cover),
                  ),
                    currentAccountPicture:CircleAvatar(
                      backgroundImage: AssetImage('../images/fb.jpg'),
                    ) ,
                    accountName: Text('Flutter Baba'),
                    accountEmail: Text('anusrivas07@gmail.com'),
                ),
                drawerItem(name: 'Profile', icon: Icons.person),
                drawerItem(name: 'Cart', icon: Icons.add_shopping_cart),
                drawerItem(name: 'Order', icon: Icons.shop),
                Divider(
                  color: Colors.white,
                  thickness: 3.0,
                ),
                ListTile(
                  leading: Text('Communicate',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ),
                drawerItem(name: 'Change', icon: Icons.lock),
                drawerItem(name: 'Log Out', icon: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage:  AssetImage('images/pizza09.jpg')),
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration:InputDecoration(
                hintText: 'Search Food',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search,color: Colors.white,),
                filled: true,
                fillColor: Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoriesContainer(image: '../images/pizza01.jpg', name: 'All'),
                categoriesContainer(image: '../images/pizza02.jpg', name: 'Burger'),
                categoriesContainer(image: '../images/pizza03.jpg', name: 'Recipe'),
                categoriesContainer(image: '../images/pizza04.jpg', name: 'Pizza'),
                categoriesContainer(image: '../images/Coco.jpg', name: 'Drink'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 510.0,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: [
                bottomContainer(image: '../images/pizza01.jpg', price: 123, name: 'Famous All'),
                bottomContainer(image: '../images/pizza02.jpg', price: 540, name: 'Burger All'),
                bottomContainer(image: '../images/pizza03.jpg', price: 256, name: 'Recipe All'),
                bottomContainer(image: '../images/pizza04.jpg', price: 369, name: 'Pizza All'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
