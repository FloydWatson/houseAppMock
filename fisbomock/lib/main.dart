import 'package:fisbomock/Screens/add_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import screens like this
import './Screens/home_screen.dart';
import './Screens/listing_list_screen.dart';
import './Screens/listing_screen.dart';
import './Screens/favourites_screen.dart';
import './Screens/my_properties_screen.dart';

import './Providers/listing_provider.dart';
import './Providers/user_provider.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ListingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        
      ],
      child: MaterialApp(
        title: "FISBO",
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 122, 204, 1),
          buttonColor: Colors.lightBlue,
          primaryTextTheme: TextTheme(
            button: TextStyle(color: Colors.white),
            
          ),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ListingListScreen.routeName: (ctx) => ListingListScreen(),
          ListingScreen.routeName: (ctx) => ListingScreen(),
          FavouritesScreen.routeName: (ctx) => FavouritesScreen(),
          MyPropertiesScreen.routeName: (ctx) => MyPropertiesScreen(),
          AddPropertyScreen.routeName: (ctx) => AddPropertyScreen(),
        },
      ),
    );
  }
}
