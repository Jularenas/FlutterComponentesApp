import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";

  String _currentOp = "Americano";

  List<String> _opcionesDropDwon = [
    "Americano",
    "Asiatico",
    "Europeo",
    'Africano'
  ];

  TextEditingController _inputFieldController =
      new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text("letras ${_nombre.length}"),
          hintText: "nombre de la persona",
          helperText: "solo el nombre",
          helperStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: "nombre",
          icon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          suffixIcon: Icon(Icons.accessibility)),
      onChanged: (texto) {
        setState(() {
          _nombre = texto;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text("letras ${_email.length}"),
          hintText: "E-mail de la persona",
          helperText: "solo el email",
          helperStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: "E-mail",
          icon: Icon(
            Icons.email,
            color: Colors.blue,
          ),
          suffixIcon: Icon(Icons.email)),
      onChanged: (texto) {
        setState(() {
          _email = texto;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      //keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text("letras ${_email.length}"),
          hintText: "Password de la persona",
          helperText: "solo el Password",
          helperStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: Icon(Icons.lock)),
      onChanged: (texto) {
        setState(() {
          _password = texto;
        });
      },
    );
  }

  Widget _crearFecha(context) {
    return TextField(
      controller: _inputFieldController,
      enableInteractiveSelection: true,
      //keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text("letras ${_email.length}"),
          hintText: "Fecha de nacimiento",
          helperText: "Fecha de nacimiento",
          helperStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: "Fecha de nacimiento",
          icon: Icon(
            Icons.calendar_today,
            color: Colors.blue,
          ),
          suffixIcon: Icon(Icons.calendar_view_day)),

      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
        _inputFieldController.text = _fecha;
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text("Email: $_email "),
      trailing: Text("Origen continental:$_currentOp"),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        locale: Locale("es"),
        initialDate: new DateTime(2020),
        firstDate: new DateTime(1999),
        lastDate: new DateTime(2020));

    if (picked != null) {
      print(picked);
      setState(() {
        _fecha = picked.toString();
      });
    }
  }

  List<DropdownMenuItem<String>> _getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _opcionesDropDwon.forEach((opcion) => lista.add(DropdownMenuItem(
          child: Text(opcion),
          value: opcion,
        )));
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.map),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _currentOp,
              items: _getOpcionesDropdown(),
              onChanged: (opcion) {
                setState(() {
                  _currentOp = opcion;
                });
                print(opcion);
              }),
        )
      ],
    );
  }
}
