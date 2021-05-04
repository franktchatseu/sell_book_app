import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  int categoryId;
  String categoryImage;
  String categoryName;
  CategoryCard(this.categoryId,this.categoryName,this.categoryImage);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
         Container(
           height: 110,
           width: 190,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5),),
             image: DecorationImage(
               image: AssetImage("assets/images/category_test.png"),
               fit: BoxFit.cover
             )
           ),
         ),
          Container(
            height: 50,
            width: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5),),
                color: Colors.teal
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:8.0,top: 13),
              child: Text(this.categoryName,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
            ),
          ),
    ]);
  }
}
