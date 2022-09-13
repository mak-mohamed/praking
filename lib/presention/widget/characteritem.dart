import 'package:flutter/material.dart';
import 'package:preak/data/model/characters.dart';

class CharctrsItem extends StatelessWidget {
  final Characters_model characters_model;

  const CharctrsItem({super.key, required this.characters_model});

  @override
  Widget build(BuildContext context) {
    double myh = MediaQuery.of(context).size.height;
    double myw = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
            width: myw / 4 - 3,
            height: myh / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            )),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage.assetNetwork(
              imageCacheHeight: 100,
              imageCacheWidth: 100,
              fit: BoxFit.fill,
              width: myw / 2 - 10,
              height: myh / 3,
              placeholder: 'lib/assets/images/loading.gif',
              image: characters_model.img!),
        ),
        Column(children: [
          Flexible(child: Container()),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(15)),
            height: myh / 27,
            width: myw / 2,
            child: Center(
                child: Text(
              characters_model.name!,
              style: TextStyle(color: Colors.white),
            )),
          )
        ]),
      ],
    );
  }
}
