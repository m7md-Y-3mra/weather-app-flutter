import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Logo app
            Container(
              color: Colors.teal[500],
              child: const DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'WEATHER APP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Home tap
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                leading: Icon(Icons.home, color: Colors.teal[500]),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.teal[500]),
                ),
                onTap: () => Navigator.pushNamed(context, '/home_screen'),
              ),
            ),

            // Hourly tap
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                leading: Icon(Icons.access_time, color: Colors.teal[500]),
                title: Text(
                  'Hourly Forecast',
                  style: TextStyle(color: Colors.teal[500]),
                ),
                onTap: () => Navigator.pushNamed(context, '/hours_screen'),
              ),
            ),

            // Daily tap
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                leading: Icon(Icons.calendar_month, color: Colors.teal[500]),
                title: Text(
                  'Daily Forecast',
                  style: TextStyle(color: Colors.teal[500]),
                ),
                onTap: () => Navigator.pushNamed(context, '/daies_screen'),
              ),
            ),

            // Cities tap
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                leading: Icon(Icons.location_city, color: Colors.teal[500]),
                title: Text(
                  'Cities',
                  style: TextStyle(color: Colors.teal[500]),
                ),
                onTap: () => Navigator.pushNamed(context, '/cities_screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
