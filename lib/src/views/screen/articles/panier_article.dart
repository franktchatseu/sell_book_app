import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/article_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierArticle extends StatefulWidget {
  @override
  _PanierArticleState createState() => _PanierArticleState();
}

class _PanierArticleState extends State<PanierArticle> {

  @override
  void initState(){
    super.initState();
    getPanier();
  }

  Future<void> getPanier() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String result = sharedPreferences.getString('panier');
    final List<Article> decodedDatad = Article.decode(result);
    setState(() {
      this.currentListArticle = decodedDatad;
    });
    decodedDatad.forEach((element) {
      print (element.name);
    });
  }

  //remove artikel
  Future<void> resetPanier() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Article> listArticle = [];
    String encodeArticle = Article.encode(listArticle);
    await sharedPreferences.setString('panier', encodeArticle);
  }

  List<Article> currentListArticle = [
  new Article(1,1 ,"La Bonne Fontaine", "Science", 100, 2, "assets/images/categories/1.jpg"),
  new Article(1,2 ,"Mme Bovari", "Education", 100, 2, "assets/images/categories/3.jpg"),
  new Article(1,3,"Le Cid de Pierre", "Culture", 100, 2, "assets/images/categories/4.jpg"),
  new Article(1,4, "Anaton ", "Sport", 100, 2, "assets/images/categories/2.jpg")
  ];
  //afficher message
  showMessage(String message){
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.teal,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Panier"),
      ),
      body: Stack(
        children: [
          this.currentListArticle.length>0?
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: currentListArticle.length,
            itemBuilder: (context, index) {
              return ArticleItem(this.currentListArticle[index]);
            },
          ):Center(child: Text("Votre panier est actuellement vide",style: TextStyle(
              fontWeight: FontWeight.w500,color: Colors.blueGrey,fontSize: 18,letterSpacing: 0.8
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      resetPanier();
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierArticle()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.amber
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7,),
                            Text("Reset",style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Google Sans'),

                            ),


                          ],
                        )
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text("En cour de developpement"),
                          ));
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal
                      ),
                      child: Row(
                        children: [

                          Text("Valider",style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Google Sans'),

                          ),
                          SizedBox(width: 7,),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),

                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
