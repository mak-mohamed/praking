import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:preak/constant/mystring.dart';


class CharactersApi
{

  Future<List<dynamic>>  getallcharacters ()async{
    final response = await http.get(Uri.parse(MyString.allcharacters ));
    List<dynamic> listcharacters = [];
    if (response.statusCode == 200) {
      listcharacters   = json.decode(response.body) ;
    } else {
      throw Exception('Failed to load ');
    }
    return listcharacters ;
  }





}