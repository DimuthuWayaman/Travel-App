import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';

class LocationCard extends StatefulWidget {
  final bool ascending;
  const LocationCard({super.key, required this.ascending});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  final List<Map<String, String>> locations = [
    {
      'name': 'Paris',
      'description': 'The city of lights and love.',
      'imageUrl': 'assets/images/loc1.jpg',
    },
    {
      'name': 'New York',
      'description': 'The city that never sleeps.',
      'imageUrl': 'assets/images/loc2.jpg',
    },
    {
      'name': 'Tokyo',
      'description': 'A blend of tradition and modernity.',
      'imageUrl': 'assets/images/loc3.jpg',
    },
    {
      'name': 'Sydney',
      'description': 'Home to the iconic Opera House.',
      'imageUrl': 'assets/images/loc4.jpg',
    },
    {
      'name': 'Rome',
      'description': 'A journey through ancient history.',
      'imageUrl': 'assets/images/loc2.jpg',
    },
    {
      'name': 'Cairo',
      'description': 'Gateway to the pyramids and the Nile.',
      'imageUrl': 'assets/images/loc1.jpg',
    },
  ];
  List<Map<String, String>> get _sortedLocations {
    final copy = List<Map<String, String>>.from(locations);
    copy.sort((a, b) {
      final aName = a['name']!;
      final bName = b['name']!;
      return widget.ascending ? aName.compareTo(bName) : bName.compareTo(aName);
    });
    return copy;
  }

  @override
  Widget build(BuildContext context) {
    //horizontal list view of location cards
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _sortedLocations.length,
        itemBuilder: (context, index) {
          final location = _sortedLocations[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: index == _sortedLocations.length - 1 ? 16.0 : 0,
            ),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(location['imageUrl']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location['name']!,
                        style: TextStyle(
                          color: MyTheme.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        location['description']!,
                        style: TextStyle(
                          color: MyTheme.whiteColor.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
