import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/article_item.dart';
import 'package:seel_book_app/src/views/screen/payemnt/our_information.dart';
import 'package:seel_book_app/src/views/utils/panier_action.dart';
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
      PanierActionUI.panierCount = this.currentListArticle.length;
      this.currentListArticle.forEach((element) {
        this.totalPrice += element.prix;
      });
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
  double totalPrice = 0;
  double livraisonCost = 1000;
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
        actions: [
          PanierActionUI()
        ],
      ),
      body: Stack(
        children: [
          this.currentListArticle.length>0?
          Padding(
            padding: const EdgeInsets.only(top:65.0,left: 5,right: 5  ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: currentListArticle.length,
              itemBuilder: (context, index) {
                return ArticleItem(this.currentListArticle[index]);
              },
            ),
          ):Center(child: Text("Votre panier est actuellement vide",style: TextStyle(
              fontWeight: FontWeight.w500,color: Colors.blueGrey,fontSize: 18,letterSpacing: 0.8
          ))),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                color: Colors.red.shade900,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text("Articles",style: TextStyle(
                           fontWeight: FontWeight.w500,color: Colors.white,fontSize: 19,
                       )),
                       Text("${this.currentListArticle.length}",style: TextStyle(
                         fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19,
                       )),
                     ],
                   ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Livraison",style: TextStyle(
                          fontWeight: FontWeight.w500,color: Colors.white,fontSize: 19,
                        )),
                        Text("${livraisonCost} Fcfa",style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19,
                        )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Total à Payer",style: TextStyle(
                          fontWeight: FontWeight.w500,color: Colors.white,fontSize: 19,
                        )),
                        Text("${totalPrice+livraisonCost} Fcfa",style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19,
                        )),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
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
                            color: Colors.white.withOpacity(0),
                            border: Border.all(color: Colors.blueGrey,width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 7,),
                            Text("Reset",style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Google Sans'),

                            ),


                          ],
                        )
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OurInformation()));
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
