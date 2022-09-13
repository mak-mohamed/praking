import 'package:flutter/material.dart';
import 'package:preak/constant/mycolor.dart';
import 'package:preak/data/model/characters.dart';
import 'package:preak/presention/screen/details_page.dart';
import '../presention/screen/HomePage_screen.dart';
import '../presention/widget/characteritem.dart';

class SearchCharacters extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Characters_model> searchcharcters = allcharacterslist
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: searchcharcters.length,
        itemBuilder: (context, index) {
          return InkWell(onTap: () => Navigator.of(context).pushNamed('details',arguments:searchcharcters[index] ),
            child: Container(
                height: 125,
                child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: ClipRRect(
                              child: Image.network(
                                  fit: BoxFit.fill,
                                  cacheWidth: 60,
                                  cacheHeight: 60,
                                  searchcharcters[index].img!),
                              borderRadius: BorderRadius.circular(75)),
                          height: 75,
                          width: 75,
                        ),
                        SizedBox(
                          width: 20,
                        ) ,
                        Center(child: Text(searchcharcters[index].name!,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20))),
                      ],
                    ))),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: 1,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        brightness: colorScheme.brightness,
        backgroundColor: MyColor().myyloow,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
        textTheme: theme.textTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }
}

