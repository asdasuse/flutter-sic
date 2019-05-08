import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sic/view/berandaModel.dart';

final List<String> img = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List child = map<Widget>(
  img,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'gambar $index ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SicService> sicService = [];
  int current = 0;

  @override
  void initState() {
    super.initState();
    sicService.add(new SicService(
        color: Colors.white, title: "Guru",iconData: Icons.terrain));
    sicService.add(new SicService(
         color: Colors.white, title: "jadwal"));
    sicService.add(new SicService(
       color: Colors.white, title: "buku"));
    sicService.add(new SicService(
        color: Colors.white, title: "Organisasi"));
    sicService.add(new SicService(
         color: Colors.white, title: "Event"));
    sicService.add(new SicService(
         color: Colors.white, title: "Blank"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        leading: new Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            tooltip: 'search',
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[_showBody()],
      ),
    );
  }

  Widget _showBody() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[_showCarousel(), _showMenu()],
        ),
      ),
    );
  }

  Widget _showCarousel() {
    return Column(children: [
      CarouselSlider(
        pauseAutoPlayOnTouch: Duration(seconds: 5),
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          img,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current == index
                      ? Colors.purple[400]
                      : Colors.purple[100]),
            );
          },
        ),
      ),
    ]);
  }

  Widget _showMenu() {
    return SizedBox(
      width: double.infinity,
      height: 220.0,
      child: new Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 6,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, position) {
            return _rowSicService(sicService[position]);
          },
        ),
      ),
    );
  }

  Widget _rowSicService(SicService sicServicee) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         new Container(
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.purple, width: 1.0),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0))),
            padding: EdgeInsets.all(12.0),
            child: new Icon(
              sicServicee.iconData,
              color: sicServicee.color,
              size: 32.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0),
          ),
          new Text(sicServicee.title, style: new TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }
}
//NIK login