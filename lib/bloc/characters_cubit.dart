import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:preak/data/repostery/characters_reposetry.dart';
import 'package:preak/data/web_services/characters_api.dart';
import '../data/model/characters.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.characters_Reposetry) : super(CharactersInitial());

  final Characters_Reposetry characters_Reposetry;

   List<Characters_model> allcharacterslist = [] ;


  List<Characters_model> getallcharacters() {
    Characters_Reposetry(charactersApi: CharactersApi())
        .getallcharacters()
        .then((value) {
      allcharacterslist = value;
      emit(LoadedData(allcharacterslist: allcharacterslist));
    });
    return allcharacterslist;
  }
}
