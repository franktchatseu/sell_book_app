import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
import 'package:seel_book_app/src/views/screen/book/book_card.dart';
import 'package:seel_book_app/src/views/screen/category/category_card.dart';
import 'package:seel_book_app/src/views/utils/panier_action.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CategoryBook extends StatefulWidget {

  int category_id;
  String category_name;
  String catogory_cover_image;
  CategoryBook({this.category_id,this.category_name,this.catogory_cover_image});

  @override
  _CategoryBookState createState() => _CategoryBookState();
}

class _CategoryBookState extends State<CategoryBook> {
  List<dynamic> _subCategories= [
    {
      "id":1,
      "cover_image":"assets/images/categories/3.jpg",
      "name":"Physique"
    },
    {
      "id":2,
      "cover_image":"assets/images/categories/1.jpg",
      "name":"Informatique"
    },
    {
      "id":3,
      "cover_image":"assets/images/categories/2.jpg",
      "name":"Histoire"
    },
    {
      "id":3,
      "cover_image":"assets/images/categories/1.jpg",
      "name":"Francais"
    },
  ];
  List<Book> listBooks = [
    new Book(1, "Anaconda", "Frank tchatseu", "coll 41", 1, 5, 200, 4, "assets/images/category_test.png"),
    new Book(2, "Nucleaire", "Nguefack", "Act22", 5, 3, 300, 3, "assets/images/categories/1.jpg"),
    new Book(3, "Tom Fleur", "Frank tchatseu", "coll 41", 1, 5, 200, 4, "assets/images/categories/4.jpg"),
    new Book(4, "Tiji Team", "Nguefack", "Act22", 5, 3, 300, 3, "assets/images/categories/6.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category_name),
        actions: [
          PanierActionUI()
        ],
      ),
      body: CustomScrollView(
        //very very important in order to be careful with some bug
        shrinkWrap: true,
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
              [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5),),
                      image: DecorationImage(
                          image: AssetImage(widget.catogory_cover_image),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Center(child: Text(widget.category_name.toUpperCase(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sous Catégories",style: TextStyle(fontSize: 18,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                ),
              ]
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom:0.0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: buildSubCategories(),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Livres",style: TextStyle(fontSize: 18,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                ),
              ]
          )),
          SliverList(delegate: SliverChildListDelegate(
              buildbooks()
          )),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom:28.0),
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                child: Text(""),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildSubCategories(){
    return ListView(
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      children: _subCategories.map((subcat) {
        return Padding(padding: EdgeInsets.all(5),child: CategoryCard(1, subcat["name"], subcat["cover_image"],card_width: 120,),);
      }).toList(),
    );
  }
  List<Widget> buildbooks(){
    List<BookCard> booksCard= [];
    this.listBooks.forEach((book) {
      BookCard bookcard = new BookCard(book);
      booksCard.add(bookcard);
    });
    return booksCard;
  }
}

