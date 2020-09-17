import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyTab() => Container(
      decoration: BoxDecoration(
          gradient:LinearGradient(
              colors: [
                Color.fromARGB(255, 161,253,185),
                Color.fromARGB(255, 210,254,173)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
      ),

    );

    return Stack(
      children: <Widget>[
        _buildBodyTab(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home").orderBy("position").getDocuments(),
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    ),
                  );
                  else
                    print(snapshot.data.documents.length);
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200.0,
                        alignment: Alignment.center,
                        child: Container()
                      ),
                    );
              },
            )
          ],
        )
      ],
    );

  }
}
