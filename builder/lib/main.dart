import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const mainApp());
}

class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  List<Widget> _cardList = [];

  void _addCheckedBox() {
    setState(() {
      _cardList.add(_carddrop());
    });
  }

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    String dropdownvalue = 'Item 1';

    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _carddrop() {
 

    final _formKey = GlobalKey<FormState>();
    bool? checkedValue = true;
    bool newValue=true;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CheckboxListTile(
              title: Text("Check Box"),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
              itemCount: _cardList.length,
              itemBuilder: (context, index) {
                return _cardList[index];
              }),
        ),
        floatingActionButton: Column(
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                _addCardWidget();
              },
              label: Text("DropDown"),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                _addCheckedBox();
              },
              label: Text("CheckBox"),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
