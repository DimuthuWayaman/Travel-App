import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';

import 'location_card.dart';

class DesTypeCategories extends StatefulWidget {
  const DesTypeCategories({super.key});

  @override
  State<DesTypeCategories> createState() => _DesTypeCategoriesState();
}

class _DesTypeCategoriesState extends State<DesTypeCategories> {
  //dummy data of destination types with images
  final List<Map<String, String>> desTypes = [
    {'type': 'Beach', 'imageUrl': 'assets/images/loc4.jpg'},
    {'type': 'Mountain', 'imageUrl': 'assets/images/loc3.jpg'},
    {'type': 'City', 'imageUrl': 'assets/images/loc2.jpg'},
    {'type': 'Desert', 'imageUrl': 'assets/images/loc1.jpg'},
    {'type': 'Forest', 'imageUrl': 'assets/images/loc3.jpg'},
    {'type': 'Island', 'imageUrl': 'assets/images/loc4.jpg'},
    {'type': 'Historic', 'imageUrl': 'assets/images/loc1.jpg'},
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //horizontal list view of destination types in rounded containers and images
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: desTypes.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              final desType = desTypes[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 4,
                    right: index == desTypes.length - 1 ? 16.0 : 4,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? MyTheme.primaryColor.withOpacity(0.2)
                                  : MyTheme.whiteColor,
                              borderRadius: BorderRadius.circular(100),
                              border: isSelected
                                  ? Border.all(
                                      color: MyTheme.primaryColor,
                                      width: 2,
                                    )
                                  : null,
                              boxShadow: [
                                if (isSelected)
                                  BoxShadow(
                                    color: MyTheme.primaryColor.withOpacity(
                                      0.5,
                                    ),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                desType['imageUrl']!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            desType['type']!,
                            style: TextStyle(
                              color: isSelected
                                  ? MyTheme.primaryColor
                                  : MyTheme.textColor,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              height: 1,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //get category name from des type categories
          child: Text(
            desTypes[selectedIndex]['type']!,
            style: TextStyle(
              color: MyTheme.textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // child: Text("Explore", style: TextStyle(
          //   color: MyTheme.textColor,
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // ),
          // ),
        ),
        SizedBox(height: 10),
        LocationCard(ascending: false),
      ],
    );
  }
}
