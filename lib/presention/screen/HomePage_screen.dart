import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preak/bloc/characters_cubit.dart';
import 'package:preak/constant/mycolor.dart';
import 'package:preak/data/web_services/characters_api.dart';
import '../../data/model/characters.dart';
import '../../data/repostery/characters_reposetry.dart';
import '../../helper/searchcharacters.dart';
import '../widget/characteritem.dart';
import 'package:flutter/services.dart';

late List<Characters_model> allcharacterslist;

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context)
        .getallcharacters(); // init lazy cubit
  }

  @override
  Widget build(BuildContext context) {
    return build_bloc_edgit();
  }

  Widget build_bloc_edgit() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is LoadedData && state.allcharacterslist.length > 0) {
          allcharacterslist = state.allcharacterslist;

          return Buidscreen();
        } else {
          return loading();
        }
      },
    );
  }

  Widget Buidscreen() {
    @override //for stauts bar
    void dispose() {
      super.dispose();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values); // to re-show bars
    }

    return Scaffold(
      appBar: buildmyappbar(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/logo.jpg large.jpg'))),
          child: buildgridview()),
    );
  }

  AppBar buildmyappbar() {
    return AppBar(
      title: Text('Breaking Bad',
          style: const TextStyle(color: Colors.white, fontSize: 24)),
      backgroundColor: MyColor().myyloow,
      leading: IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchCharacters());
          },
          icon: Icon(Icons.search_rounded)),
    );
  }

  Widget buildgridview() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allcharacterslist.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100,
          mainAxisExtent: 150,
          crossAxisCount: 2,
          crossAxisSpacing: 0),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: CharctrsItem(characters_model: allcharacterslist[index])),
          onTap: () {
            Navigator.of(context)
                .pushNamed('details', arguments: allcharacterslist[index]);
          },
        );
      },
    );
  }

  Widget loading() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Stack(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          'lib/assets/images/logo.jpg large.jpg',
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ],
    );
  }
}
