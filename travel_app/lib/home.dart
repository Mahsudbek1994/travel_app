// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/most_popular.dart';
import 'package:travel_app/widgets/travel_app.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            key: key,
            padding: const EdgeInsets.only(right: 10.0),
            // ignore: prefer_const_constructors
            child: Icon(Icons.menu,
              color: Colors.black,),
          )
        ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            key: key,
            padding: const EdgeInsets.only(left:15.0),
            // ignore: prefer_const_constructors;
            child: Text(
              'Travel Blog',
              style: const TextStyle(
                  fontSize: 36
              ),
            ),
          ),
          Expanded(
            flex:2,
            child: Travel_App(),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text('Most Popular',
                  style: TextStyle(fontSize: 20),),
                Text('View All',
                  style: TextStyle(fontSize: 16,
                      color: Colors.deepOrange
                  ),)
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: MostPopular(),),
        ],
      ),
    );
  }
}