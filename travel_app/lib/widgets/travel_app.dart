// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:travel_app/detail.dart';
import 'package:travel_app/model/travel.dart';


class Travel_App extends StatelessWidget {

  final _list = Travel.generateTravelApp();
  final _pageCtrl = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageCtrl,
        itemCount: _list.length ,
        itemBuilder:  (context,index){
          var travel = _list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context){
                    return DetailPage(travel: travel,);
                  }
              ));
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:35.0, right:20.0,bottom: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(travel.url,
                        width:MediaQuery.of(context).size.width,
                        height:300,
                        fit:BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(travel.location,
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white,
                                fontSize: 30.0,
                                fontStyle: FontStyle.italic)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration:BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius:BorderRadius.circular(30),
                    ),
                    // ignore: prefer_const_constructors
                    child: Icon(Icons.arrow_forward,
                      color:Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          );

        });

  }
}