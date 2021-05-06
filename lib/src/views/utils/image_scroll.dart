import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/models/Book.dart';

class ImageScroll extends StatefulWidget {
  List<dynamic> dataImage;
  ImageScroll({this.dataImage});
  @override
  _ImageScrollState createState() => _ImageScrollState();
}

class _ImageScrollState extends State<ImageScroll> {
  int imageIndex = 0;

  void _previousImage() {
    setState(() {
      this.imageIndex > 0
          ? this.imageIndex = this.imageIndex - 1
          : this.imageIndex = 0;
    });
  }

  void _NextImage() {
    setState(() {
      this.imageIndex < widget.dataImage.length - 1
          ? this.imageIndex = this.imageIndex + 1
          : this.imageIndex = this.imageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10,top: 15),
      child: Column(
        children: [
          GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity < 0) {
                // Image forwards
                _NextImage();
              } else if (details.primaryVelocity > 0) {
                // Image backwards
                _previousImage();
              }
            },
            child: Container(
              height: 250,
                child: Image.asset(
                  widget.dataImage[this.imageIndex]["image"],
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:18.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SelectedImage(
                    numberOfDots: widget.dataImage.length,
                    photoIndex: this.imageIndex)),
          ),
        ],
      ),
    );
  }
}
class SelectedImage extends StatelessWidget {
  int numberOfDots;
  int photoIndex;
  SelectedImage({this.numberOfDots, this.photoIndex});

  Widget _inactiveImage() {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.teal),
        ),
      ),
    );
  }

  Widget _activeImage() {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 14.0,
          width: 14.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.0)
              ]),
        ),
      ),
    );
  }

  //list of dots
  List<Widget> _builtDots() {
    List<Widget> dots = [];
    for (int i = 0; i < this.numberOfDots; i++) {
      dots.add(i == this.photoIndex ? _activeImage() : _inactiveImage());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _builtDots(),
    );
  }
}