part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class LoadedData extends CharactersState {
  List<Characters_model> allcharacterslist;
  LoadedData({required this.allcharacterslist});
}

class DownloadError extends CharactersState {}
