
import 'dart:convert';

class Article{
  int _id;
  int _book_id;
  String _name;
  String _category;
  double _prix;
  int _quantity;
  String _image;
  Article(this._id,this._book_id,this._name,this._category,this._prix,this._quantity,this._image);

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(jsonData['id'],jsonData['book_id'],jsonData['name'], jsonData['category'], jsonData['prix'], jsonData['quantity'], jsonData['image']);
  }

  static Map<String, dynamic> toMap(Article article) => {
    'id': article.id,
    'book_id':article.book_id,
    'name': article.name,
    'category': article.category,
    'prix': article.prix,
    'quantity': article.quantity,
    'image': article.image,
  };

  static String encode(List<Article> articles) => json.encode(
    articles
        .map<Map<String, dynamic>>((article) => Article.toMap(article))
        .toList(),
  );

  static List<Article> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Article>((item) => Article.fromJson(item))
          .toList();


  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  double get prix => _prix;

  set prix(double value) {
    _prix = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  int get book_id => _book_id;

  set book_id(int value) {
    _book_id = value;
  }
}