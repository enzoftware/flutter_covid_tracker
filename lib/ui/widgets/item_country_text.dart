import 'package:flutter/material.dart';

class ItemCountryText extends StatefulWidget {
  final int quantity;
  final String description;
  final Color colorQuantity;

  const ItemCountryText({
    Key key,
    this.quantity,
    this.description,
    this.colorQuantity,
  }) : super(key: key);

  @override
  _ItemCountryTextState createState() => _ItemCountryTextState();
}

class _ItemCountryTextState extends State<ItemCountryText>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = IntTween(begin: 0, end: widget.quantity).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Column(
        children: <Widget>[
          Text(
            animation.value.toString(),
            style: TextStyle(
              fontSize: 18,
              color: widget.colorQuantity,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(widget.description)
        ],
      ),
    );
  }
}
