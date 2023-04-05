import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 11),
      margin: EdgeInsets.only(top: 10),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color(0xFF133C58)),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black45,
        tabs: [
          SizedBox(
          width: 125,
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.amber[600]),
              Text(
                'HOME'
                )
              ],
            ),
          ),
          Tab(
            icon: Icon(Icons.calendar_month_outlined),
            iconMargin: EdgeInsets.zero,
            text: '일정',
          ),
          Tab(
            icon: Icon(Icons.person),
            iconMargin: EdgeInsets.zero,
            text: '나의정보',
          ),
          SvgPicture.asset('assets/icons/AngelClub.svg'),
          // Image.asset('assets/images/AngelClub.png'),
        ],
      ),
    );
  }
}