import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _chechkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheckbox(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
        value: _sliderValue,
        activeColor: Colors.indigoAccent,
        min: 100,
        max: 400,
        label: "SlidySlide",
        onChanged: (_chechkBoxVal)
            ? null
            : (val) {
                setState(() {
                  _sliderValue = val;
                  print(val);
                });
              });
  }

  Widget _crearImagen() {
    return Container(
      //child: Image(
      //  height: _sliderValue,
      //  width: _sliderValue,
      //  fit: BoxFit.contain,
      //  image: NetworkImage("https://i.imgur.com/8V97Zmu.gif"),
      //),
      child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage("https://i.imgur.com/8V97Zmu.gif")),
      height: _sliderValue,
      width: _sliderValue,
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        title: Text("Desactivar slider"),
        value: _chechkBoxVal,
        onChanged: (checked) {
          setState(() {
            _chechkBoxVal = checked;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Desactivar slider"),
        value: _chechkBoxVal,
        onChanged: (checked) {
          setState(() {
            _chechkBoxVal = checked;
          });
        });
  }
}
