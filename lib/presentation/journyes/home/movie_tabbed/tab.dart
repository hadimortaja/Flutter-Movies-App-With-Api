import 'package:flutter/cupertino.dart';

class Tab {
  final int index;
  final String title;

  Tab({
    @required this.index, 
     @required this.title
    }):assert(index>=0,'index cannot be negative'),assert(title !=null,'title Cannot be null');
}//////
