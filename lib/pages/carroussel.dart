import 'package:flutter/material.dart';
import 'package:my_flutter/widget/carousel.dart';
import 'package:my_flutter/widget/clipper/diagonal_clipper.dart';

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  double _appBarHeight = 100.0;
  var height;
  var width;

  @override
  initState() {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    _scrollController.addListener(() {
      if (_scrollController.offset >= _appBarHeight)
        setState(() {
          _opacity = 1.0;
        });
      else
        setState(() {
          _opacity = 0.0 + (_scrollController.offset / _appBarHeight * 1.0);
        });
    });
    super.initState();
  }

  void _onSliderChanged(int index) {
    print('index now is $index');
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () {
            print('home pressed');
          },
        ),
        title: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                width: width * .7,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(.6))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              onTap: () {
                print('search tapped');
              },
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            onPressed: () {
              print('wallet pressed');
            },
          ),
        ],
        backgroundColor: Colors.green.withOpacity(_opacity),
        elevation: 0.0,
      ),
    );
  }

  Widget _buildSlider() {
    return Carousel(
      items: [
        'https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/10/22/17/46/scotland-1761292_1280.jpg',
        'https://cdn.pixabay.com/photo/2017/03/27/14/49/beach-2179183_1280.jpg',
      ]
          .map((img) => Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Image.network(
                  img,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ))
          .toList(),
      autoPlay: true,
      viewportFraction: 1.0,
      height: 120,
      onPageChanged: _onSliderChanged,
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: height,
    );
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            color: Colors.blue,
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: DiagonalClipper(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.blueGrey,
                    width: width,
                    height: 250,
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    _buildSlider(),
                    _buildBody()
                  ],
                )
              ],
            ),
          ),
        ),
        _buildAppBar(),
      ],
    ));
  }
}
