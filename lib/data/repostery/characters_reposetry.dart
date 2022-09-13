import 'package:flutter/material.dart';

import '../web_services/characters_api.dart';
import '../model/characters.dart';



class Characters_Reposetry {
  Characters_Reposetry({required  this.charactersApi});
   final CharactersApi charactersApi ;


  Future<List<Characters_model>> getallcharacters()async{
 var listcharacters = await charactersApi.getallcharacters();
 return listcharacters.map((elemnt) => Characters_model.fromJson(elemnt)).toList();
  }





}