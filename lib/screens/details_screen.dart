import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/section_detail_model.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  final String title;
  const DetailsScreen({Key? key , required this.id , required this.title}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<SectionDetailModel> dataModels=[];
  @override
  void initState() {
    super.initState();
    readDetailsSectionJson();
  }
  void readDetailsSectionJson()
  {
    dataModels=[];
    DefaultAssetBundle.of(context).loadString('assets/database/section_details_db.json').then((value) {
      var res=json.decode(value);
      res.forEach((section){
        if(section['section_id']==widget.id)
          dataModels.add(SectionDetailModel.fromJson(section));
      });
      setState(() {});
    }).catchError((error)=>print(error));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("${widget.title}"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemCount: dataModels.length,
            itemBuilder:(context, index) =>listViewBuilder(sectionDetailModel: dataModels[index]),
            separatorBuilder:(context, index) => Divider(height: 1,color: Colors.grey.withOpacity(.8),),
            ),
      ),
    );
  }
  Widget listViewBuilder({required SectionDetailModel sectionDetailModel})
  {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:Colors.grey.withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0 , 3),
            )
          ]
      ),
      child: ListTile(
        title: Text("${sectionDetailModel.reference}", textDirection: TextDirection.rtl),
        subtitle: Text("${sectionDetailModel.content}" , textDirection: TextDirection.rtl,style: TextStyle(
            fontSize: 20,color: Colors.black
        ),),
        leading: Container(child: Text('${sectionDetailModel.count}'),),
      ),
    );
  }


}

