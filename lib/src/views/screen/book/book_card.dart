import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';
class BookCard extends StatelessWidget {
  Book book;
  BookCard(this.book);
  //build star
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
                    fit: BoxFit.cover, image: AssetImage("assets/images/category_test.png"))),
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
                      this.book.title.toUpperCase(),
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
                      "Maison Edition: ${this.book.edition} ",
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
                      "Auteur: ${this.book.autor}",
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
                children: _builtVotes(this.book.vote_number),
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
                      "${this.book.fcfa_price} F / ${this.book.euro_price} £ Quantite: ${book.quantity} ",
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
                      onPressed: (){},
                      child: Text("Details",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Google Sans'),)),
                  SizedBox(width: 25,),
                  FlatButton(
                      padding: EdgeInsets.all(5),
                      color: Colors.teal,
                      onPressed: (){},
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
