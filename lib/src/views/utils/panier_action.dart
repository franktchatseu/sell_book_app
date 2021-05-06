import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
class PanierActionUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierArticle()));
        },
        child: Icon(
          CupertinoIcons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}
