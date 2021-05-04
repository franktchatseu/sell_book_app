import 'package:flutter/material.dart';
import 'package:seel_book_app/src/views/screen/category/category_book.dart';

class CategoryCard extends StatelessWidget {
  int categoryId;
  String categoryImage;
  String categoryName;
  double card_width;
  CategoryCard(this.categoryId,this.categoryName,this.categoryImage,{this.card_width});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryBook(category_id: this.categoryId,category_name: categoryName,catogory_cover_image: categoryImage,)));
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           Container(
             height: 90,
             width: card_width,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5),),
               image: DecorationImage(
                 image: AssetImage(categoryImage),
                 fit: BoxFit.cover
               )
             ),
           ),
            Container(
              height: 40,
              width: card_width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5),),
                  color: Colors.teal
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,top: 10),
                child: Text(this.categoryName,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
              ),
            ),
      ]),
    );
  }
}
