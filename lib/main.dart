import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';
import 'package:seel_book_app/src/logic_app/models/article_panier.dart';
import 'package:seel_book_app/src/views/screen/articles/article_item.dart';
import 'package:seel_book_app/src/views/screen/articles/panier_article.dart';
import 'package:seel_book_app/src/views/screen/category/categories_list.dart';
import 'package:seel_book_app/src/views/screen/category/category_book.dart';
import 'package:seel_book_app/src/views/screen/payemnt/our_information.dart';
import 'package:seel_book_app/src/views/utils/panier_action.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
      routes: <String, WidgetBuilder>{
        '/mbolo_app': (BuildContext context) => MyApp(),
        '/main_categories': (BuildContext context) => CategoryList(),
        '/category_detail': (BuildContext context) => CategoryList(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Book bookTEst = new Book(1, "Scian book", "Frank Tchatseu", "Cambridge", 120, 4, 500, 20, "assets/images/category_test.png");
Article articleTest = new Article(1,1, "La Bonne Fontaine", "Science", 100, 2, "assets/images/categories/1.jpg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PanierActionUI()
        ],
      ),
      body: SafeArea(
        child: Center(
          child: CategoryList(),
        ),
      ),
    );
  }
}
