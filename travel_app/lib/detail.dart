import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/model/travel.dart';

class DetailPage extends StatelessWidget {
  final  Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  // ignore: use_key_in_widget_constructors
  const DetailPage({
    required this.travel,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Stack(
        children: [
          CustomScrollView(
            slivers:[
              _buildSilverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding:EdgeInsets.only(top:MediaQuery.of(context).padding.top,
                right: 15, left:15),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },

                      child: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

  Widget _buildSilverHead(){

    return SliverPersistentHeader(
        delegate:DetailSilverDelegate(
          travel:travel,
          expandedHeight: expandedHeight,
          roundedContainerHeight:roundedContainerHeight,
        )
    );
  }
  Widget _buildDetail(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _bulidUserInfo(),
          const Padding(
            padding:EdgeInsets.symmetric(vertical:15,horizontal: 20),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                color: Colors.grey,
                fontStyle:FontStyle.italic,
                fontSize: 16,
                height: 1.5,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric (horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Featured',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                    letterSpacing: 1.5,
                  ),),
                const Text('View all',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),),

              ],
            ),
          ),
          SizedBox(height: 160, child:FeaturedWidget(),),
          const Padding(
            padding:EdgeInsets.symmetric(vertical:15,horizontal: 20),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                color: Colors.grey,
                fontStyle:FontStyle.italic,
                fontSize: 16,
                height: 1.5,
              ),),
          ),
        ],),);
  }
  Widget _bulidUserInfo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical:5),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(50),
            child:Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(travel.name,
                    style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )),
                Text(travel.location,
                    // ignore: prefer_const_constructors
                    style:TextStyle(
                      fontSize: 20,)),

              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.share,
            color: Colors.grey ,)
        ],
      ),
    );
  }
}
class DetailSilverDelegate extends SliverPersistentHeaderDelegate{
  final Travel travel;
  final double expandedHeight;
  final double  roundedContainerHeight;
  DetailSilverDelegate({
    required this.travel,
    required this.expandedHeight,
    required this.roundedContainerHeight,

  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(opacity: 0.9,
          child: Image.asset(travel.url,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover,),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left:0,
          child: Container(
            width:MediaQuery.of(context).size.width,
            height:roundedContainerHeight,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),

          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset - 120,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travel.name,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 30)),
              Text(travel.location,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 15)),
            ],
          ),
        )

      ],);
  }

  @override
  double get maxExtent => expandedHeight;

  @override

  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return  true;
  }
}
// ignore: use_key_in_widget_constructors
class FeaturedWidget extends StatelessWidget{
  final _list = Travel.generateMostPopular();
  @override
  Widget build(Object context) {
    return ListView.separated(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var travel = _list[index];
          // ignore: sized_box_for_whitespace
          return Container(
            width:120,
            child:Image.asset(travel.url,
                fit:BoxFit.cover),

          );

        },
        separatorBuilder: (_, index)=>const SizedBox(width:10),
        itemCount: _list.length);
  }

}