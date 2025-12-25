import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // Dummy list of destinations categories
  final List<String> categories = [
    'All',
    'Popular',
    'Recommended',
    'New',
    'Trending',
    'Nearby',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: index == -1 ? 16 : 12,
                  left: index == 0 ? 16 : 0,
                  bottom: 12.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? MyTheme.primaryColor : MyTheme.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: MyTheme.primaryColor.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected
                          ? MyTheme.whiteColor
                          : MyTheme.textColor,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
