import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../Providers/listing_provider.dart';

class ListingItem extends StatelessWidget {
  final String id;
  final String streetNumber;
  final String streetName;
  final String city;
  final int price;
  final int bed;
  final int bath;
  final int views;
  final int offers;
  final String imagePath;
  final String heading;

  ListingItem(
      this.id,
      this.streetNumber,
      this.streetName,
      this.city,
      this.price,
      this.bed,
      this.bath,
      this.views,
      this.offers,
      this.imagePath,
      this.heading);

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);

    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse('$price'));
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                FittedBox(
                  child: Image.asset('assets/123NorthcoteSt.jpg'),
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(36, 119, 255, 0.6)),
                                color: Color.fromRGBO(36, 119, 255, 0.6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.binoculars,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  ' $views',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(36, 119, 255, 0.6)),
                                color: Color.fromRGBO(36, 119, 255, 0.6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.tags,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  ' $offers',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '$heading',
                        style: GoogleFonts.lato(
                          // posible heading style. will move to theme
                          textStyle: TextStyle(
                            letterSpacing: .25,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w600
                        //  ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('$streetNumber $streetName $city'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${fmf.output.symbolOnLeft}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.bed),
                            Text(
                              ' $bed',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.bath),
                            Text(
                              ' $bath',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.star),
                        onPressed: () {},
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
