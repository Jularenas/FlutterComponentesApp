import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(
            height: 30,
          ),
          _cardTipoDos(),
          SizedBox(
            height: 30,
          ),
          _cardTipoUno(),
          SizedBox(
            height: 30,
          ),
          _cardTipoDos(),
          SizedBox(
            height: 30,
          ),
          _cardTipoUno(),
          SizedBox(
            height: 30,
          ),
          _cardTipoDos(),
          SizedBox(
            height: 30,
          ),
          _cardTipoUno(),
          SizedBox(
            height: 30,
          ),
          _cardTipoDos(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text("this card"),
            subtitle: Text(
                "complete explanation of this card title subtitle in listTile"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text("cancel")),
              FlatButton(onPressed: () {}, child: Text("ok"))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              fadeInDuration: Duration(milliseconds: 100),
              height: 300,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1500964757637-c85e8a162699?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=778&q=80")),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("aaaa"),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(31),
      ),
    );
  }
}
