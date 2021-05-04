import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/views/screen/category/category_card.dart';

class CategoryList extends StatelessWidget {



  List<dynamic> _mainCategories= [
    {
      "id":1,
      "cover_image":"assets/images/categories/1.jpg",
      "name":"Science"
    },
    {
      "id":2,
      "cover_image":"assets/images/categories/2.jpg",
      "name":"Education"
    },
    {
      "id":3,
      "cover_image":"assets/images/categories/3.jpg",
      "name":"Histoire"
    },
    {
      "id":1,
      "cover_image":"assets/images/categories/4.jpg",
      "name":"Science"
    },
    {
      "id":2,
      "cover_image":"assets/images/categories/5.png",
      "name":"Roman"
    },
    {
      "id":3,
      "cover_image":"assets/images/categories/6.png",
      "name":"Poesie"
    },
    {
      "id":1,
      "cover_image":"assets/images/categories/3.jpg",
      "name":"Culture"
    },
    {
      "id":2,
      "cover_image":"assets/images/categories/1.jpg",
      "name":"Art"
    },
    {
      "id":3,
      "cover_image":"assets/images/categories/5.png",
      "name":"Poesie"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
        itemCount: this._mainCategories.length,
        itemBuilder: ( context,  index) {
          return CategoryCard(this._mainCategories[index]["id"], this._mainCategories[index]["name"], this._mainCategories[index]["cover_image"],card_width: 170,);
        });
  }
}
