import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/listing_provider.dart';

class ListingImage extends StatelessWidget {


  final String id;

    ListingImage(this.id);

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);

    

    return 


    GestureDetector(
      onTap: () {listingProvider.getNewPhoto(id);},
          child: Card(
          
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
                      child: Image.asset('${listingProvider.activeUrl}'),
                      fit: BoxFit.fill,
                    ),
                    
                  ],
                ),
                
               
              ],
            ),
          ),
        ),
    );
  }
}

// Container(
//       child:  FittedBox(child: Image.asset('$url'),  fit: BoxFit.fill,),
//     );