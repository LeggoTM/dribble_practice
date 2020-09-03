import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";

const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(226, 115, 138, 1),
  WHITE: Colors.white,
};

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      backgroundColor: myColors[PRIMARY],
      body: _Body(),
    );
  }
}

Widget _myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      backgroundColor: myColors[WHITE],
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 15,
        ),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: myColors[PRIMARY],
            size: 30,
          ),
          onPressed: () => print('Menu pressed'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 15,
          ),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: myColors[PRIMARY],
              size: 30,
            ),
            onPressed: () => print(
              'Search pressed',
            ),
          ),
        ),
      ],
    ),
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }
}
