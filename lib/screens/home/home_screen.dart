import 'package:customize_button/customize_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillersoft/utilities/assets_paths/assets_paths.dart';
import 'package:pillersoft/utilities/core/kpadding.dart';
import 'package:pillersoft/utilities/core/kradius.dart';
import 'package:pillersoft/utilities/theme/ktext_theme.dart';

import '../../utilities/custom_colors/custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: Container(
              padding: KPadding.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.gradientGreen1)),
              child: Icon(Icons.grid_view, color: Colors.black)),
        ),
        title: Text(
          "Activity",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Latest",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Following",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Sample data count
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 8.0),
                  child: _buildCard(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius50,
            side: BorderSide(color: CustomColors.gradientGreen1)),
        child: Icon(
          Icons.add,
          color: CustomColors.gradientGreen1,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                icon: Image.asset(
                  ImagePath.home,
                  height: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                icon: Image.asset(
                  ImagePath.grp,
                  height: 25,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 48), // Space for FAB
              IconButton(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                icon: Image.asset(
                  ImagePath.search,
                  height: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return Container(
      width: 250,
      padding: KPadding.all12,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColors.gradientGreen1, CustomColors.gradientGreen2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 235.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: kBorderRadius6),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "San Francisco, CA",
                  style: KText.r12Grey,
                ),
                Spacer(),
                CustomizedButton(
                  text: 'Connect',
                  enableBorder: true,
                  fontStyle: KText.r12White,
                  backgroundColor: CustomColors.shadeGrey300,
                  borderColor: CustomColors.white,
                  contentPadding: KPadding.symmetric(10, 0),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Wonderful building near London Big Ben with amazing windows...",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey[400],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olivia Redman",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "2 minutes ago",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Icon(Icons.favorite_border, size: 15, color: Colors.white),
                    SizedBox(height: 5),
                    Text(
                      "325",
                      style: KText.r10White,
                    ),
                    SizedBox(height: 5),
                    Icon(Icons.share, size: 15, color: Colors.white),
                    SizedBox(height: 5),
                    Icon(Icons.message, size: 15, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
