import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Providers/listing_provider.dart';

class ListingImage extends StatelessWidget {
  final String id;

  ListingImage(this.id);

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                FittedBox(
                  child: Image.asset('${listingProvider.activeUrl}'),
                  fit: BoxFit.fill,
                ),
                Positioned.fill(
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.arrowCircleLeft,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              listingProvider.getNewPhotoLeft(id);
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              listingProvider.getNewPhotoRight(id);
                            },
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//       child:  FittedBox(child: Image.asset('$url'),  fit: BoxFit.fill,),
//     );
