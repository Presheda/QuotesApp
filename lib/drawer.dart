import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotesapp/src/pages/contact_us.dart';
import 'package:quotesapp/src/pages/favourites_page.dart';
import 'package:quotesapp/src/pages/rate_us.dart';
import 'package:quotesapp/styles/colors.dart';
import 'package:quotesapp/utils/tools.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget draw(String svg, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 30,),
            SvgPicture.asset(
              svg,
              width: 30,
              color: Colors.white,
            ),
            SizedBox(width: 20,),
            Text(
              text,
              style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 22, color: Colors.white),
            )
          ],
        ),
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    Tools.multiImage[Random().nextInt(4)],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black.withOpacity(0.36),
                ),
                Container(
                  padding: EdgeInsets.only(right: 25),
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/images/cancel.svg',
                            width: 20,
                            color: Colors.white,
                          ),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 25),
                        child: Center(
                          child: Text(
                            '“Whatever you are, be a good one.”\n ― Abraham Lincoln',
                            style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300, height: 1.5,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: blue,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      draw('assets/images/spike.svg', 'Quote of the day'),
                      Padding(
                        padding:EdgeInsets.only(left:35.0),
                        child:Container(
                        height:1.0,
                        width:MediaQuery.of(context).size.width,
                        color:Colors.white.withOpacity(0.3),),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(FavouritesPage.routeName);
                        },
                        child: draw('assets/images/heart.svg', 'Liked Quotes')
                      ),
                      Padding(
                        padding:EdgeInsets.only(left:35.0),
                        child:Container(
                        height:1.0,
                        width:MediaQuery.of(context).size.width,
                        color:Colors.white.withOpacity(0.3),),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            new PageRouteBuilder(
                                opaque: false,
                                barrierColor: Colors.black.withOpacity(0.5),
                                barrierDismissible: true,
                                pageBuilder: (BuildContext context, __, _) {
                                    return ContactUs();
                                }
                            )
                          );
                        },
                        child: draw('assets/images/phone.svg', 'Contact Us')
                      ),
                      Padding(
                        padding:EdgeInsets.only(left:35.0),
                        child:Container(
                        height:1.0,
                        width:MediaQuery.of(context).size.width,
                        color:Colors.white.withOpacity(0.3),),),
                      draw('assets/images/share.svg', 'Share App'),
                      Padding(
                        padding:EdgeInsets.only(left:35.0),
                        child:Container(
                        height:1.0,
                        width:MediaQuery.of(context).size.width,
                        color:Colors.white.withOpacity(0.3),),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            new PageRouteBuilder(
                                opaque: false,
                                barrierColor: Colors.black.withOpacity(0.5),
                                barrierDismissible: true,
                                pageBuilder: (BuildContext context, __, _) {
                                    return RateUs();
                                }
                            )
                          );
                        },
                        child: draw('assets/images/rate.svg', 'Rate Us')
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}