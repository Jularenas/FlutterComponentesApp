import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icon_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<Widget> lista = _crearLista(snapshot.data, context);
          return ListView(
            children: lista,
          );
        } else if (snapshot.hasError) {
          return ListView();
        } else {
          return ListView();
        }
      },
    );
  }

  List<Widget> _crearLista(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((item) {
      opciones.add(Column(
        children: <Widget>[
          ListTile(
            title: Text(item["texto"]),
            leading: getIcon(item["icon"]),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
            onTap: () {
              //final route =
              //MaterialPageRoute(builder: (context) => AlertPage());
              Navigator.pushNamed(context, item["ruta"]);
            },
          ),
          Divider()
        ],
      ));
    });
    return opciones;
  }
}
