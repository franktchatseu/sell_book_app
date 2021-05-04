import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';
import 'package:seel_book_app/src/views/utils/image_scroll.dart';

class BookDetail extends StatefulWidget {
  Book book;
  BookDetail(this.book);
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  int imageIndex = 0;
  List<dynamic> dataImage =[
    {
      "image":"assets/images/category_test.png",
    },
    {
      "image":"assets/images/category_test.png",
    },
  ];
  int start_number = 0;
  String label_number = "";
  void addStartNumber(int number) {
    setState(() {
      start_number = number;
    });
    switch (start_number) {
      case 1:
        label_number = "A éviter";
        break;
      case 2:
        label_number = "Décevant";
        break;
      case 3:
        label_number = "Moyen";
        break;
      case 4:
        label_number = "Très bien";
        break;
      case 5:
        label_number = "Excéllent";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //show my image scrool widget
        ImageScroll(dataImage: this.dataImage,),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              height: 40,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),topRight: Radius.circular(80))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Information sur le livre",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18,letterSpacing: 0.8
                  ),
                ),
              ),
            )
          ],
        ),
        //show description
        Padding(
          padding: const EdgeInsets.only(top:18,left: 8,right: 0,bottom: 20),
          child: Row(
            children: [
              Container(
                child: Expanded(child: Text(
                  "il s'agit ici de la description du livre. ici vous trouverez toutes les information relatives au document. par exemple, il s'agit ici de la description du livre. ici vous trouverez toutes les information relatives au document.ce livre est extrait du ...",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,fontSize: 15,
                  ),
                )),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              height: 40,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.amber.shade700.withOpacity(0.6),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),topRight: Radius.circular(80))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Votre Avis",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18,letterSpacing: 0.8
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      this.start_number >= 1
                          ? Icons.star
                          : Icons.star_border_sharp,
                      color: Colors.amber[500],
                      size: 35,
                    ),
                    onPressed: () => addStartNumber(1),
                  ),
                  IconButton(
                    icon: Icon(
                      this.start_number >= 2
                          ? Icons.star
                          : Icons.star_border_sharp,
                      color: Colors.amber[500],
                      size: 35,
                    ),
                    onPressed: () => addStartNumber(2),
                  ),
                  IconButton(
                    icon: Icon(
                      this.start_number >= 3
                          ? Icons.star
                          : Icons.star_border_sharp,
                      color: Colors.amber[500],
                      size: 35,
                    ),
                    onPressed: () => addStartNumber(3),
                  ),
                  IconButton(
                    icon: Icon(
                      this.start_number >= 4
                          ? Icons.star
                          : Icons.star_border_sharp,
                      color: Colors.amber[500],
                      size: 35,
                    ),
                    onPressed: () => addStartNumber(4),
                  ),
                  IconButton(
                    icon: Icon(
                      this.start_number >= 5
                          ? Icons.star
                          : Icons.star_border_sharp,
                      color: Colors.amber[500],
                      size: 35,
                    ),
                    onPressed: () => addStartNumber(5),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0,top: 8),
                child: FlatButton(
                  minWidth: 200,
                    color: Colors.teal,
                    onPressed: (){},
                    child: Text("Acheter",style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Google Sans'),)),
              ),
            ],
          )
        ),

      ],
    );
  }
}