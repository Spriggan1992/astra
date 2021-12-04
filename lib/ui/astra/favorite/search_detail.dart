import 'package:flutter/material.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.2),
        title: Text(
          'Подробная анкета',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/girl.png').image, fit: BoxFit.cover),
          ),
          child: ListView(
            padding: const EdgeInsets.only(top: 16, left: 15, right: 15),
            children: const [
              InfoDetailCard(),
              InfoDetailCard(),
              InfoDetailCard(),
              InfoDetailCard(),
            ],
          )),
    );
  }
}

class InfoDetailCard extends StatelessWidget {
  const InfoDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(85, 85, 85, 0.7),
        border:
            Border.all(color: const Color.fromRGBO(85, 85, 85, 1), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 32),
          Text(
            'Характер',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Индивидуальные свойства поведения человека в жизни отражают характер. Помимо этого, он проявляется в демонстрируемом отношении индивида к действительности, которое выражается в поступках. Основные черты характера закладываются уже',
            style: TextStyle(
                color: Color.fromRGBO(251, 251, 251, 0.8),
                fontSize: 14,
                height: 1.5),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
