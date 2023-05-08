

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/categories_model.dart';

class MyProvider extends ChangeNotifier{
 List<CategoriesModel> categoriesList = [];
 late CategoriesModel categoriesModel;

 Future<void> getCategories() async {
    List<CategoriesModel> newCategoriesList = [];
   QuerySnapshot querySnapshot  = await FirebaseFirestore.instance.collection("categories").doc('EAYaIaft2C0lsc3v6Wdx').collection('burger').get();
    querySnapshot.docs.forEach((element) {
      categoriesModel = CategoriesModel(image: element.data()["image"], name: element.data()['name'],
      );
       newCategoriesList.add(categoriesModel);
       categoriesList = newCategoriesList;
    });
 }
 get throwList{
   return categoriesList;
 }
}