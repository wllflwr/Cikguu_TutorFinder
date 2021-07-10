import 'package:flutter/material.dart';
import 'package:cikguu_app/model/subject.dart';

Color yl = Color(0xffF0C742);
Color wy = Colors.white;
Color bl = Colors.black;

// accept reject button
Color rd = Color(0xffF36A68);
Color gn = Color(0xff75E6A2);

TextStyle sb = TextStyle(fontSize: 19, fontWeight: FontWeight.w600);
TextStyle nm = TextStyle(fontWeight: FontWeight.w400);

List<GridLayout> subjectList = [
  GridLayout('Malay', 'Bahasa Melayu'),
  GridLayout('English', 'Bahasa Inggeris'),
  GridLayout('Science', 'Sains'),
  GridLayout('Mathematics', 'Matematik'),
  GridLayout('History', 'Sejarah'),
  GridLayout('Moral Education', 'Pendidikan Moral'),
  GridLayout('Islamic Education', 'Pendidikan Islam'),
  GridLayout('Add. Mathematics', 'Matematik Tambahan'),
  GridLayout('Chemistry', 'Kimia'),
  GridLayout('Biology', 'Biologi'),
  GridLayout('Physics', 'Fizik'),
  GridLayout('Economics', 'Ekonomi'),
];
