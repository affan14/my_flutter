import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/widget/carousel.dart';
import 'package:my_flutter/widget/clipper/diagonal_clipper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import 'carroussel_bloc.dart';
import 'carroussel_event.dart';
import 'carroussel_state.dart';

class CarrousselPage extends StatefulWidget {
  static const String routeName = "/carroussel";

  @override
  _CarrousselPageState createState() => _CarrousselPageState();
}

class _CarrousselPageState extends State<CarrousselPage> {
  CarrousselBloc _carrousselBloc = CarrousselBloc();
  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  double _appBarHeight = 100.0;
  var height;
  var width;

  _CarrousselPageState() : _carrousselBloc = CarrousselBloc();

  @override
  initState() {
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
    this._carrousselBloc.dispatch(LoadCarrousselEvent());
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
              onTapDown: (tapDetails) {
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
    return BlocBuilder<CarrousselEvent, CarrousselState>(
      bloc: _carrousselBloc,
      builder: (
        BuildContext context,
        CarrousselState currentState,
      ) {
        if (currentState is CarrousselLoading) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: width,
                  height: 120,
                  color: Colors.white,
                  child: Center(
                    child: Icon(Icons.image, color: Colors.grey[400],),
                  ),
                ),
              ),
            ),
          );
        }
        if (currentState is CarrousselNotLoaded) {
          return new Container(
              child: new Center(
            child: new Text('Error'),
          ));
        }
        return Carousel(
          items: (currentState as CarrousselLoaded)
              .pixabayImages
              .map((img) => Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: CachedNetworkImage(
                      imageUrl: img.webformatURL,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList(),
          autoPlay: true,
          viewportFraction: 1.0,
          // enlargeCenterPage: true,
          height: 120,
          onPageChanged: _onSliderChanged,
          withIndicator: true,
        );
      },
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
