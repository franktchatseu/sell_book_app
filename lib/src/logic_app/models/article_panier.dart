
class Article{
  int _id;
  String _name;
  String _category;
  double _prix;
  int _quantity;
  Article(this._id,this._name,this._category,this._prix,this._category);

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
}