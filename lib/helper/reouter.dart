import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preak/data/model/characters.dart';
import 'package:preak/presention/screen/HomePage_screen.dart';
import '../bloc/characters_cubit.dart';
import '../constant/myroute.dart';
import '../data/repostery/characters_reposetry.dart';
import '../data/web_services/characters_api.dart';
import '../presention/screen/details_page.dart';

class Approuter {
  late CharactersCubit charactersCubit;
  late Characters_Reposetry characters_reposetry;

  Approuter() {
    characters_reposetry = Characters_Reposetry(charactersApi: CharactersApi());
    charactersCubit = CharactersCubit(characters_reposetry);
  }

  Route? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => charactersCubit, child: Home_Page()));

      case detailsRoute:
        final characters = settings.arguments as Characters_model;
        return MaterialPageRoute(
            builder: (_) => Details_Page(characters_modell: characters));
    }
  }
}
