import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ArticleItem extends StatefulWidget {
  Article article;
  ArticleItem(this.article);

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  increaseQuantity(){
    setState(() {
      widget.article.quantity ++;
    });
  }
  decreaseQuantity(){
    setState(() {
      if(widget.article.quantity>0)
        widget.article.quantity --;
    });
  }
  //remove artikel
  Future<void> removeArtivle(Article article) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String result = sharedPreferences.getString('panier')?? "";
    List<Article> listArticle;
    if(result == ""){
      listArticle = [];
    }
    else{
      listArticle = Article.decode(result);
    }
    setState(() {
      listArticle.removeWhere((element) => element.book_id==article.book_id);
    });
    String encodeArticle = Article.encode(listArticle);
    await sharedPreferences.setString('panier', encodeArticle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(this.widget.article.image))),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(1),
                      width: 180,
                      child: Text(
                        this.widget.article.name,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Google Sans'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      width: 180,
                      child: Text(
                        "Categorie: ${this.widget.article.category} ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Google Sans'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      width: 180,
                      child: Text(
                        "Prix: ${this.widget.article.prix} Fcfa / 3 £",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Google Sans'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(1),
                      child: Text(
                        "Qté:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Google Sans'),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: decreaseQuantity,
                          child: Container(
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                            "${widget.article.quantity}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Google Sans')
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: increaseQuantity,
                          child: Container(
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.teal
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            print("ze");
                            removeArtivle(widget.article);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierArticle()));
                          },
                          child: Container(
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red.shade900
                            ),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
