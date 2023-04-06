# Daegu_FC_Angel-Main_HomePage_UI

플러터로 '대구FC 엔젤' 어플리케이션의 메인 홈페이지 탭의 UI 구현

## 프로젝트 소개

브라이튼에서 개발 중인 '대구FC 엔젤' 모바일 app의 메인 홈페이지를 디자인에 맞게 간단하게 구현해보았습니다.

### :computer: 개발 환경
 - Flutter 3.7.3
 - Dart 2.19.2
 - IDE : VSCode
 - 테스트 AVD :  Pixel XL API 22(android-x64 emulator) - 5.5인치(16:9)
 
### :books: 활용한 라이브러리
 - [flutter_svg](https://pub.dev/packages/flutter_svg): 2.0.4
 - ~~[carousel_slider](https://pub.dev/packages/carousel_slider): 4.2.1~~
 
### :eyes: 상세 설명
   - 파일 구성
       - main.dart : 메인 화면 리스트(홈 화면, 일정 화면, 나의 정보 화면, AngelClub 안내 화면)와 하단 네비게이션 바를 포함
       - bottombar.dart : 하단 네비게이션 바를 구현
       - main_home.dart : 'HOME' 탭의 화면을 구현
  
  #### main.dart
  > `Scaffold` 위젯을 사용하였고, `DefaultTabController`와 `TabBarView` 위젯으로 하단 네비게이션 바를 통한 페이지 전환이 가능하도록 구현하였습니다.
  
  
  #### bottombar.dart
  > `TabBar` 위젯을 활용하여 하단 네비게이션 바를 만들었습니다.
  > 
  > `TabBar`를 `Container` 위젯으로 감싸서 색상과 높이, padding과 margin을 설정하였고, `TabBar`의 `Tab`이 선택되었을 때 디자인을 UI 디자인에 맞게 indicator를 설정하였습니다.
  >
  > `Tab`은 HOME, 일정, 나의정보, AngelClub 4개로 구성되어 있으며, AngelClub 탭의 경우 `SVGPicture`위젯을 활용하여 svg 파일로 나타내었습니다.
  
  
  #### main_home.dart
  > HOME 탭의 화면을 구성하는 파일입니다. Stateful 위젯으로, 경기 일정에 대한 정보 `_data`와 현재 선택한 경기 일정 버튼의 index `_selected`를 state로 가집니다.
  >
  > `Flexible` 위젯 3개를 활용하여 상단 제목, 경기 일정 확인, 회원 정보 3개의 프레임으로 나누었습니다.
  >
  > 경기 일정을 나타내는 위젯은 `ListView`를 활용하였고, `ListView.builder`로 `ListView`의 item을 `Container`와 `GestureDetector`를 사용하여 버튼의 형태로 나타내었습니다.
  >
  >
  > `int _selected` 인스턴스는 현재 선택된 경기 일정 위젯의 index를 가리킵니다.
  >
  > 경기 일정 위젯이 선택되면 `setState()`를 호출하여 `_selected`를 선택한 위젯의 index로 변경하며,
  > 
  > `_selected`와 `ListView.builder`의 index가 동일할 때(해당 위젯이 선택되었을 때), `Container`와 `Text`의 색상 등을 변경하여 해당 위젯이 선택되었음을 사용자가 인지할 수 있습니다.
  >
  > 또한 `Visuality` 위젯으로 선택된 경기 일정에서만 '예매하기' 버튼이 나타나도록 하였습니다.
  >
  >
  > carousel_slider 라이브러리를 활용하여 경기 일정 리스트를 나타내려 했으나, `CarouselSlider`의 경우 하나의 item을 포커스하여 나타내기 때문에, 여러 경기 일정을 한번에 확인하기에는 적합하지 않아 `ListView`위젯으로 대체하였습니다. 
