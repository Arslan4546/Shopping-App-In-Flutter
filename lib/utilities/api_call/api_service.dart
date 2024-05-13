import 'dart:convert';
import '../../Models/ProductModel.dart';
import 'package:http/http.dart'as http;
import '../appUrl/my_urls.dart';


class ApiService{

Future<ProductModel> getApiData() async{

  var data;
  final response = await http.get(Uri.parse(AppUrl.baseUrl));

  data = jsonDecode(response.body.toString());
  if(response.statusCode==200){
    return ProductModel.fromJson(data);

  }else{
    return ProductModel.fromJson(data);
  }

}

}