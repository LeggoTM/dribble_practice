import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";
const SECONDARY = "lightpink";

const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(226, 115, 138, 1),
  WHITE: Colors.white,
  SECONDARY: Color.fromRGBO(247, 225, 227, 1),
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
          left: 12,
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
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                    bottom: 20,
                    top: 15,
                  ),
                  child: Text(
                    'Cosmetics that Everyone loves!',
                    style: TextStyle(
                      fontSize: 47,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        children: [
                          _ItemTile(
                            height: constraints.maxHeight * 0.85,
                            imagePath: 'assets/images/makeup1.png',
                            price: 15.00,
                            addCallback: () => print('Add button pressed'),
                            favouriteCallback: () =>
                                print('Favourite button pressed'),
                          ),
                          Column(
                            children: [
                              _ItemTile(
                                height: constraints.maxHeight * 0.4,
                                imagePath: 'assets/images/makeup2.png',
                                price: 55.00,
                                addCallback: () => print('Add button pressed'),
                                favouriteCallback: () =>
                                    print('Favourite button pressed'),
                              ),
                              _ItemTile(
                                height: constraints.maxHeight * 0.4,
                                imagePath: 'assets/images/makeup3.png',
                                price: 75.00,
                                addCallback: () => print('Add button pressed'),
                                favouriteCallback: () =>
                                    print('Favourite button pressed'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
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

class _ItemTile extends StatelessWidget {
  final double height;
  final String imagePath;
  final Function favouriteCallback;
  final Function addCallback;
  final double price;

  const _ItemTile({
    Key key,
    @required this.height,
    @required this.imagePath,
    @required this.favouriteCallback,
    @required this.addCallback,
    @required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: height,
              image: AssetImage(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: myColors[PRIMARY],
                ),
                onPressed: () => favouriteCallback,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '\$$price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => addCallback,
              child: Container(
                decoration: BoxDecoration(
                  color: myColors[SECONDARY],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.add,
                    color: myColors[PRIMARY],
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
