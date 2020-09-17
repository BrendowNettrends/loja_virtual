import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
            colors: [
              Color.fromARGB(255, 249,219,128),
              Color.fromARGB(255, 255,255,255)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),

    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Flutter's\nClothing", style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
