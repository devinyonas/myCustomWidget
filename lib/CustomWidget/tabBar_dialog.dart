import 'package:flutter/material.dart';

var _ddlItems = <String>['-Select Type-', 'Squad', 'Regiment', 'Zone']
    .map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();

class TabBarDialog extends StatefulWidget {
  @override
  _TabBarDialogState createState() => _TabBarDialogState();
}

class _TabBarDialogState extends State<TabBarDialog>
    with SingleTickerProviderStateMixin {
  String _dropdownValue = '-Select Type-';
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        height: 320,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Attendee',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: new TabBar(
                controller: _controller,
                tabs: [
                  new Tab(
//                      icon: const Icon(Icons.home),
                    text: 'By Name',
                  ),
                  new Tab(
//                      icon: const Icon(Icons.my_location),
                    text: 'By Squad',
                  ),
                ],
              ),
            ),
            new Container(
              height: 150.0,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Search by Name',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Name is Required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          elevation: 4,
                          highlightElevation: 0,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: const Text('Add',
                                style: TextStyle(fontSize: 20)),
                          ),
                          onPressed: () {
//                  bool v1 = _formkey.currentState.validate();
//                  bool v2 = _validateDropDown();
//                  if (v1 && !v2) {
//                    var data = {
//                      'name': _eventNameController.text,
//                      'date': (selectedDate.millisecondsSinceEpoch / 1000)
//                          .toString(),
//                      'event_type': _dropdownValue,
//                    };
                            Navigator.pop(context, "test");
//                  }
                          },
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(
                        icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
