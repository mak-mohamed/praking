import 'package:flutter/material.dart';
import 'package:preak/constant/mycolor.dart';
import 'package:preak/data/model/characters.dart';

import '../../bloc/characters_cubit.dart';
import '../widget/characteritem.dart';

class Details_Page extends StatelessWidget {
  Details_Page({super.key, required this.characters_modell});
  final Characters_model characters_modell;

  @override
  Widget build(BuildContext context) {

      Widget builsSliverList(){return         SliverList(
          delegate: SliverChildListDelegate([
            Container(
                height:MediaQuery.of(context).size.height,
                width: double.infinity,
                color: MyColor().mygren,
                child: Stack(
                
                  children: [
                    Image.asset('lib/assets/images/prakingpadback.jpg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width:double.infinity),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      buildDetials('NAME:  ', characters_modell.name!),
                      buildDetials('birthday:  ', characters_modell.birthday!),
                      buildDetials('occupation:  ',  characters_modell.occupation.toString()),
                      Expanded(child: Container(),)
                    ]),
                  ],
                ))
          ]),
        );}
  
    return Scaffold(
      body: CustomScrollView(slivers: [
        buildSliverAppbar(),
        builsSliverList()
      ]),
    );


   
  }

  Widget buildSliverAppbar() {
    return SliverAppBar(
        expandedHeight: 600,
        pinned: true,
        stretch: true,
        backgroundColor: MyColor().mygren,
        flexibleSpace: FlexibleSpaceBar(
        //  expandedTitleScale:600 ,
          title: Text(characters_modell.nickname!,
              style: TextStyle(color: Colors.white)),
          background:buildImageOrProgress()
        ));
  }

  Widget buildDetials(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: key,
              style:  TextStyle(
                  color: MyColor().mygren,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: value,
              style:  TextStyle(color: MyColor().mygren, fontSize: 16))
        ]),
      ),
    );
  }
  Widget buildImageOrProgress(){
  return  Image.network(
               characters_modell.img!  ,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyColor().myyloow,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                );
 }
 
}
