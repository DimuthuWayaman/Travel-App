import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: MyTheme.textColor),
                maxLines: 1,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Search for destinations...',
                  hintStyle: TextStyle(color: MyTheme.hintColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: Icon(CupertinoIcons.search, color: MyTheme.whiteColor),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
