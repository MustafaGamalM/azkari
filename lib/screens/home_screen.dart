
import 'dart:convert';

import 'package:azkari/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../models/section_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections=[];
  @override
  void initState() {
    super.initState();
    readSectionJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('أذكار المسلم') ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: sections.length,
            itemBuilder:(context, index) => sectionBuilder(model: sections[index]), ),
      ),
    );
  }
Widget sectionBuilder({required SectionModel model})
 {
   return InkWell(
     onTap: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailsScreen(title:model.name! ,id: model.id!)));
     },
     child: Container(
       width: double.infinity,
       height: 110,
       margin: const EdgeInsets.all(12),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
           gradient: LinearGradient(
         end: Alignment.centerLeft,
        begin:Alignment.centerRight,
         colors: [
           Colors.lightGreenAccent,
           Colors.green,
           Colors.lightGreen
         ]
       )
       ),
       child:Center(child: Text(model.name!,style: TextStyle(fontSize: 22,color: Colors.black),)) ,
     ),
   );
 }

 void readSectionJson()
  {
    DefaultAssetBundle.of(context).loadString('assets/database/sections_db.json').then((value) {
      var res=json.decode(value);
      res.forEach((section){
       sections.add(SectionModel.fromJson(section));
      });
      setState(() {});
    }).catchError((error)=>print(error));
  }
}
