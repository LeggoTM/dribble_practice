import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";
const SECONDARY = "lightpink";
const GREY = "grey";

const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(226, 115, 138, 1),
  WHITE: Colors.white,
  SECONDARY: Color.fromRGBO(247, 225, 227, 1),
  GREY: Colors.grey,
};

var priceTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

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
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
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
                        //mainAxisAlignment: MainAxisAlignment.center,
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
                                height: constraints.maxHeight * 0.39,
                                imagePath: 'assets/images/makeup2.png',
                                price: 55.00,
                                addCallback: () => print('Add button pressed'),
                                favouriteCallback: () =>
                                    print('Favourite button pressed'),
                              ),
                              _ItemTile(
                                height: constraints.maxHeight * 0.39,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 5,
                  bottom: 20,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      'Recommended',
                      style: TextStyle(
                          color: myColors[WHITE],
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    InkWell(
                      onTap: () => print('arrow button'),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: myColors[WHITE],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: myColors[PRIMARY],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      Positioned(
                        right: 20,
                        child: Container(
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.8,
                          decoration: BoxDecoration(
                            color: myColors[WHITE],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              topLeft: Radius.circular(95),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: Container(
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                height: constraints.maxHeight * 0.8,
                                image: AssetImage('assets/images/makeup4.png'),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(
                                    flex: 3,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * 0.45,
                                    child: Text(
                                      'Multi shades multiple options available',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: myColors[GREY],
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),
                                  Text(
                                    '\$55.00',
                                    style: priceTextStyle,
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FavouriteButton(
                                    favouriteCallback: () => print(
                                      'favorite button pressed',
                                    ),
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                  AddButton(
                                    addCallback: () => print(
                                      'Add button pressed',
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
              child: FavouriteButton(favouriteCallback: favouriteCallback),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: priceTextStyle,
            ),
            SizedBox(
              width: 20,
            ),
            AddButton(addCallback: addCallback),
          ],
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.addCallback,
  }) : super(key: key);

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback(),
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
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key key,
    @required this.favouriteCallback,
  }) : super(key: key);

  final Function favouriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        size: 25,
        color: myColors[PRIMARY],
      ),
      onPressed: () => favouriteCallback(),
    );
  }
}
