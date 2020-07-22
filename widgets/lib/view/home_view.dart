import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  get pageHeight => MediaQuery.of(context).size.height;
  get pageWidth => MediaQuery.of(context).size.width;
  ThemeData get theme => Theme.of(context);
  final String motivationImage =
      "https://images.unsplash.com/photo-1528716321680-815a8cdb8cbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=710&q=80";
  final String catImage =
      "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1027&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: buildAspectRatioListView()),
          Expanded(flex: 4, child: buildTextTitle()),
          Expanded(flex: 7, child: Image.network(motivationImage)),
          buildAndroidButton(() {}),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: FlutterLogo(),
      leading: Text("hello"),
      backgroundColor: Colors.pink,
      brightness: Brightness.light,
      centerTitle: false,
    );
  }

  Widget buildAspectRatioListView() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.all(pageHeight * 0.01),
      itemBuilder: (context, index) => builContainerSample(),
    );
  }

  Text buildTextTitle() {
    return Text(
      "this cat is learning flutter",
      style: theme.textTheme.headline1.copyWith(fontWeight: FontWeight.w100),
      textAlign: TextAlign.center,
      textScaleFactor: 0.5,
    );
  }

  Padding buildAndroidButton(VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
          child: Container(
            constraints: BoxConstraints(minHeight: 56),
            child:
                Center(child: Icon(Icons.favorite, color: theme.primaryColor)),
          ),
          onPressed: onPressed),
    );
  }

  Widget builContainerSample() {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(pageHeight * 0.05),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(child: Image.network(catImage)),
              Expanded(child: buildCardWidget())
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardWidget() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Flutter"), FlutterLogo()],
      ),
    );
  }
}
