import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _slideValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _createSlider(),
              Expanded(
                child: _createImage(),
              )
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _slideValue,
      min: 10.0,
      max: 400.0,
      onChanged: (value) {
        setState(() {
          _slideValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage(
            'https://javadesde0.com/wp-content/uploads/typescript-1280x720.jpg'),
        width: _slideValue,
        fit: BoxFit.contain);
  }
}
