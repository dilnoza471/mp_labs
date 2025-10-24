import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget{
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void toggle(){
    if(_isLiked){
      _isLiked = false;
    }else{
      _isLiked = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: IconButton(
        icon: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          color: _isLiked ? Colors.red : null,
        ),
        onPressed: toggle,
      ),
    );
  }
}