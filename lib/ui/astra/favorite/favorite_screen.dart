import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = const [
    Tab(
        child: Text(
      'Ваши лайки',
    )),
    Tab(
        child: Text(
      'Лайки вас',
    )),
    Tab(
        child: Text(
      'Подумать',
    )),
    Tab(
        child: Text(
      'Стоп лист',
    )),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black87,
            size: 35,
          ),
        ),
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when profile swapped
          },
          controller: _controller,
          tabs: list,
        ),
        title: Text(
          'Избранное',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        children: [
          GridView.builder(
            itemCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return FavoriteDetailWidget();
            },
          ),
          GridView.builder(
            itemCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return FavoriteDetailWidget();
            },
          ),
          GridView.builder(
            itemCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return FavoriteDetailWidget();
            },
          ),
          GridView.builder(
            itemCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return FavoriteDetailWidget();
            },
          ),
        ],
      ),
    );
  }
}

class FavoriteDetailWidget extends StatelessWidget {
  const FavoriteDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(217, 191, 131, 1), width: 1.5),
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset('assets/girl.png', fit: BoxFit.cover)
                        .image),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: (MediaQuery.of(context).size.width / 2) - 20,
                height: 42,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    color: Color.fromRGBO(251, 251, 251, 0.2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Настя, 26',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Россия, Москва',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(251, 251, 251, 0.5),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 5,
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(251, 251, 251, 0.2),
            radius: 18,
            child: Image.asset(
              'assets/paper_plane.png',
              color: Colors.white,
              scale: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}
