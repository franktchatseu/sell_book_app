class Book {
  int _id;
  String _title;
  String description;
  String _edition;
  String _autor;
  int _vote_number;
  double _fcfa_price;
  double _euro_price;
  int _quantity;
  String _cover_image;
  //contructor
  Book(this._id, this._title, this._autor, this._edition, this._quantity,
      this._euro_price, this._fcfa_price, this._vote_number,this._cover_image,{this.description});

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  double get euro_price => _euro_price;

  set euro_price(double value) {
    _euro_price = value;
  }

  double get fcfa_price => _fcfa_price;

  set fcfa_price(double value) {
    _fcfa_price = value;
  }

  int get vote_number => _vote_number;

  set vote_number(int value) {
    _vote_number = value;
  }

  String get autor => _autor;

  set autor(String value) {
    _autor = value;
  }

  String get edition => _edition;

  set edition(String value) {
    _edition = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get cover_image => _cover_image;

  set cover_image(String value) {
    _cover_image = value;
  }
}
