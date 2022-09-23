import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _passsword = '';
  String _date = '';
  String _powerSelected = 'Volar';

  List powers = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs de texto'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            const Divider(),
            _createEmail(),
            const Divider(),
            _createPassword(),
            const Divider(),
            _createDate(context),
            const Divider(),
            _createDropdown(),
            const Divider(),
            _createPerson(),
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_name.length}'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            suffixIcon: const Icon(Icons.accessibility),
            icon: const Icon(Icons.account_circle)),
        onChanged: (valor) {
          setState(() {
            _name = valor;
            print('nombre: $_name');
          });
        });
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('nombre es $_name'),
      subtitle: Text('email es $_email'),
      trailing: Text('$_powerSelected'),
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
              print('nombre: $_email');
            }));
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: const Icon(Icons.lock_open),
            icon: const Icon(Icons.lock)),
        onChanged: (valor) => setState(() {
              _passsword = valor;
              print('nombre: $_passsword');
            }));
  }

  Widget _createDate(context) {
    return TextField(
        controller: _inputFieldDate,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            suffixIcon: const Icon(Icons.perm_contact_calendar),
            icon: const Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: const Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDate.text = _date;
        print(picked);
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    powers.forEach((power) {
      lista.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return lista;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton<String>(
            value: _powerSelected,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _powerSelected = opt!;
              });
            }),
      ],
    );
  }
}
