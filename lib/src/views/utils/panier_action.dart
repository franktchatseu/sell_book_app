import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
class PanierActionUI extends StatefulWidget {
  static int panierCount = 0;
  PanierActionUI();

  @override
  _PanierActionUIState createState() => _PanierActionUIState();
}

class _PanierActionUIState extends State<PanierActionUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierArticle()));
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left:1,top: 1),
              height: 20,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.red.shade900
              ),
              child: Center(child: Text("${PanierActionUI.panierCount==null?0:PanierActionUI.panierCount}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),)),
            ),
            Icon(
              CupertinoIcons.shopping_cart,
              size: 30,
            ),

          ],
        ),
      ),
    );
  }
}
