import 'package:flutter/material.dart';

class ListingImage extends StatelessWidget {

  final String url;

    ListingImage(this.url);

  @override
  Widget build(BuildContext context) {

    

    return 


    Card(
        
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
                    child: Image.asset('$url'),
                    fit: BoxFit.fill,
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