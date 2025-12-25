import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';
import 'package:travel_app/widgets/category_list.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/des_type_categories.dart';
import '../widgets/location_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.bgColor,
      body: ListView(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "Where would you like to go?",
              style: TextStyle(
                color: MyTheme.textColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20,),
          CustomSearchBar(),
          SizedBox(height: 10,),
          CategoryList(),
          SizedBox(height: 10,),
          LocationCard(ascending: true),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Categories",
                style: TextStyle(
                  color: MyTheme.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("See All",
                style: TextStyle(
                  color: MyTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              )
            ],
          ),
          SizedBox(height: 10,),
          DesTypeCategories(),
          SizedBox(height:100,),
        ],
      ),
    );
  }
}
