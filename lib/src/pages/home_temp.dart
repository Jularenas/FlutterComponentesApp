import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  //const HomeTemp({Key key}) : super(key: key);
  final lista = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("componentes temp"),
      ),
      body: ListView(
        children: _listaMap(),
      ),
    );
  }

  List<Widget> _listaTiles() {
    List<Widget> retorno = new List();
    for (var nume in lista) {
      String str = "$nume";
      ListTile tile = new ListTile(
        title: Text(str),
      );
      retorno..add(tile)..add(Divider());
    }
    return retorno;
  }

  List<Widget> _listaMap() {
    List<Widget> resp = lista
        .map((item) => Column(
              children: <Widget>[
                ListTile(
                  title: Text("$item"),
                  subtitle: Text("subtitulo"),
                  leading: Icon(Icons.radio_button_unchecked),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () => {},
                ),
                Divider()
              ],
            ))
        .toList();
    return resp;
  }
}
