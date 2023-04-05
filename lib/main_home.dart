import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> _data = [
    ['04.16', 'SUN', '대구', '광주', '19:00', '04.09 14:00'],
    ['04.22', 'SAT', '대구', '대전', '16:30', '04.15 14:00'],
    ['05.05', 'FRI', '대구', '울산', '14:00', '04.28 14:00'],
    ['05.09', 'TUE', '대구', '포항', '19:30', '05.02 20:00'],
    ['05.27', 'SAT', '대구', '인천', '19:00', '05.20 14:00'],
  ];
  late int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15.0),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '2023년 대구FC',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              ),
                          ),
                          Text(
                            '홈경기 예매하기',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/DaeguFC.svg',
                        height: 64,
                        width: 68,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      '경기장 : DGB대구은행파크',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '다가 올 홈경기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            ),
                        ),
                        TextButton.icon(
                            style: TextButton.styleFrom(foregroundColor: Colors.black),
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined),
                            label: Text(
                              '전체일정',
                              style: TextStyle(
                                fontSize: 14
                                ),
                            ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = index;
                              });
                            },
                            child: Container(
                              width: 120,
                              margin: EdgeInsets.symmetric(horizontal: 7.5),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _selected == index
                                      ? Colors.blue[800]
                                      : Colors.white,
                                  border: _selected == index
                                      ? null
                                      : Border.all(
                                          width: 2.0,
                                          color: Color.fromARGB(8, 0, 0, 0),
                                          ),
                                  borderRadius: BorderRadius.circular(17.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                // 경기 날짜
                                Row(
                                  children: [
                                    Text(
                                      _data[index][0],
                                      style: TextStyle(
                                        color: _selected == index
                                            ? Colors.white
                                            : Colors.blue[700],
                                        fontSize: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        _data[index][1],
                                        style: TextStyle(
                                          color: _selected == index
                                              ? Colors.cyanAccent[100]
                                              : Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // 경기 팀
                                Text(
                                  '${_data[index][2]} vs ${_data[index][3]}',
                                  style: TextStyle(
                                    color: _selected == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                // 경기 시작 시간
                                Text(
                                  _data[index][4],
                                  style: TextStyle(
                                    color: _selected == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Spacer(),
                                // 예매하기 버튼
                                Visibility(
                                  visible: _selected == index,
                                  replacement: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '판매예정',
                                          style: TextStyle(
                                              fontSize: 12
                                            ),
                                          ),
                                        Text(
                                          '${_data[index][5]} 오픈',
                                          style: TextStyle(
                                              fontSize: 12
                                            ),
                                          ),
                                      ],
                                    ),
                                  child: TextButton.icon(
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.amber[300]),
                                    onPressed: () {},
                                    icon: Icon(Icons.book_online),
                                    label: Text(
                                      '예매하기',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),),
                                  ),
                                ),
                              ]),
                            ));
                      },
                    ),
                  ),
                  // CarouselSlider 보다는 ListView가 더 적합할 것 같다.
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: 140,
                  //     // disableCenter: true,
                  //   ),
                  //   items: [1, 2, 3, 4, 5].map((i) {
                  //     return Builder(
                  //       builder: (BuildContext context) {
                  //         return ClipRRect(
                  //           borderRadius: BorderRadius.circular(10),
                  //           child: Container(
                  //             width: 120,
                  //             margin: EdgeInsets.symmetric(horizontal: 7.5),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.blue[200],
                  //                 borderRadius: BorderRadius.circular(10.0)),
                  //             child: Text(
                  //               'text $i',
                  //               style: TextStyle(fontSize: 16),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '※ 홈경기 전체 20회 중 남은 경기는 15회 입니다.',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              )),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color.fromARGB(8, 0, 0, 0),
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside
                  ),
                borderRadius: BorderRadius.circular(17.0)),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          color: Colors.green[300],
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '반갑습니다.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              ),
                            Text(
                              '누구누구 엔젤 회원님!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.amber[600],
                                        ),
                                      Text(
                                        ' 사용 가능한 티켓',
                                        style: TextStyle(
                                          fontSize: 14
                                        ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '17',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      Text(
                                        ' 매',
                                        style: TextStyle(
                                          fontSize: 14
                                        ),),
                                    ],
                                  ),
                                  
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.not_interested,
                                        color: Colors.black54,
                                        ),
                                      Text(
                                        ' 사용한 티켓',
                                        style: TextStyle(
                                          fontSize: 14
                                        ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '5',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      Text(
                                        ' 매',
                                        style: TextStyle(
                                          fontSize: 14
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
