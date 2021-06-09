import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
import 'package:seel_book_app/src/views/screen/book/book_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BookCard extends StatefulWidget {
  Book book;
  BookCard(this.book);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  List<Widget> _builtVotes(int voteNumber) {
    List<Widget> votes = [];
    for (int i = 0; i < 5; i++) {
      votes.add(i < voteNumber
          ? Icon(
        Icons.star,
        size: 18,
        color: Colors.amber[500],
      )
          : Icon(
        Icons.star,
        size: 18,
        color: Colors.grey[500],
      ));
    }
    votes.add(Text("4 (17 avis)"));
    return votes;
  }

  final String encodedData = Article.encode([
    new Article(1,1, "La Bonne Fontaine", "Science", 100, 2, "assets/images/categories/1.jpg"),
    new Article(1,2, "Mme Bovari", "Education", 100, 2, "assets/images/categories/3.jpg"),
    new Article(1,3, "Le Cid de Pierre", "Culture", 100, 2, "assets/images/categories/4.jpg"),
    new Article(1,4, "Anaton ", "Sport", 100, 2, "assets/images/categories/2.jpg")
  ]);



  Future<void> buyAddPanier(Article article) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String result = sharedPreferences.getString('panier')?? "";
    List<Article> listArticle;
    if(result == ""){
       listArticle = [];
    }
    else{
      listArticle = Article.decode(result);
    }
     if(alreadyExist(listArticle, article)){
       showMessage('Le livre existe deja dans le panier');
       return;
     }
    listArticle.add(article);
    showMessage('Ajout effectif: consulter le panier');
    String encodeArticle = Article.encode(listArticle);
    await sharedPreferences.setString('panier', encodeArticle);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PanierArticle()));

  }

  bool alreadyExist(List<Article> list, Article article){
    bool status = false;
    list.forEach((element) {
      if(element.book_id == article.book_id){
        status = true;
      }
    });
   return status;
  }
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

  Future<void> getPanier() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String result = sharedPreferences.getString('panier');
    final List<Article> decodedDatad = Article.decode(result);
    decodedDatad.forEach((element) {
      print (element.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(this.widget.book.cover_image))),
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
                      this.widget.book.title.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Google Sans'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(1),
                    width: 180,
                    child: Text(
                      "Maison Edition: ${this.widget.book.edition} ",
                      style: TextStyle(
                          fontSize: 14,
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
                    width: 180,
                    child: Text(
                      "Auteur: ${this.widget.book.autor}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Google Sans'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2,),
              Row(
                children: _builtVotes(this.widget.book.vote_number),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(1),
                    width: 180,
                    child: Text(
                      "${this.widget.book.fcfa_price} F / ${this.widget.book.euro_price} £ Quantite: ${widget.book.quantity} ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Google Sans'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(5),
                    color: Colors.amber,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetail(this.widget.book)));
                      },
                      child: Text("Details",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Google Sans'),)),
                  SizedBox(width: 25,),
                  FlatButton(
                      padding: EdgeInsets.all(5),
                      color: Colors.teal,
                      onPressed: (){
                        buyAddPanier(new Article(1,widget.book.id, widget.book.title, widget.book.edition, widget.book.fcfa_price, 0, widget.book.cover_image));
                      },
                      child: Text("Acheter",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Google Sans'),)),
                ],
              ),



            ],
          )
        ],
      ),
    );
  }
}
