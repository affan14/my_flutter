import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/pages/carroussel/index.dart';

class CarrousselScreen extends StatefulWidget {
  const CarrousselScreen({
    Key key,
    @required CarrousselBloc carrousselBloc,
  })  : _carrousselBloc = carrousselBloc,
        super(key: key);

  final CarrousselBloc _carrousselBloc;

  @override
  CarrousselScreenState createState() {
    return new CarrousselScreenState(_carrousselBloc);
  }
}

class CarrousselScreenState extends State<CarrousselScreen> {
  final CarrousselBloc _carrousselBloc;
  CarrousselScreenState(this._carrousselBloc);

  @override
  void initState() {
    super.initState();
    this._carrousselBloc.dispatch(LoadCarrousselEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrousselEvent, CarrousselState>(
        bloc: widget._carrousselBloc,
        builder: (
          BuildContext context,
          CarrousselState currentState,
        ) {
          if (currentState is CarrousselLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is CarrousselNotLoaded) {
            return new Container(
              child: new Center(
              child: new Text('Error' ),
            ));
          }
          print((currentState as CarrousselLoaded).pixabayImages.map((pixabayImg){
            return pixabayImg.webformatURL;
          }).toList().toString());
          return new Container(
              child: new Center(
            child: new Text("Loaded"),
          ));
        });
  }
}
