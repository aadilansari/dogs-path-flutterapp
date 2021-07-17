import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imageslider/model/allimages.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Allimages>> fetchData() async {
  // final response = await http.get(
  //     Uri.parse('https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths'));
  // responseData = jsonDecode(response.body);
  List<Allimages> allImages = [];
  var responseData =
      jsonDecode(await rootBundle.loadString('lib/assests/data.json'));
  try {
    responseData.forEach((data) {
      List<SubPath> subPaths = [];
      data['sub_paths'].forEach((subpath) {
        subPaths.add(SubPath(
            id: subpath['id'],
            image: subpath["image"],
            title: subpath['title']));
      });
      allImages.add(
          Allimages(subPaths: subPaths, id: data['id'], title: data['title']));
    });
  } catch (e) {
    print(e);
  }
  return allImages;
}
