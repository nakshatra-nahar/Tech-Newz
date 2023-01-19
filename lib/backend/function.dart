import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:technewz/utils/key.dart';
import '../utils/category.dart';
import '../components/searchBar.dart';
import '../utils/Apikey.dart';

Future<List> fetchnews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=${Category.category}&pageSize=100&apiKey=${ApiKey.key}&q=${SearchBar.searchcontroller.text}'));
  Map result = jsonDecode(response.body);
  print(result['articles']);
  return (result['articles']);
}
