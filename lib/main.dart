import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      home: new HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Accounting App"),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: const ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),
                title: Text("餐飲"),
                subtitle: Text("45交易資料"),
                trailing: Text(
                  "\$286.0",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            new FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: const ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),
                title: Text("餐飲"),
                subtitle: Text("45交易資料"),
                trailing: Text(
                  "\$286.0",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return new NewTradePage();
              },
              isScrollControlled: true);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}

class NewTradePage extends StatefulWidget {
  @override
  NewTradePageState createState() => NewTradePageState();
}

class NewTradePageState extends State<NewTradePage> {
  var money = 0;
  var _picked = new DateTime.now();
  var formatter = new DateFormat('yyyy年MM月dd日');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Trade Page"),
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: IconButton(
                  icon: new Icon(
                    Icons.adjust,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 0),
                child: Text(
                  "123\$",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ],
          ),
          preferredSize: const Size.fromHeight(48.0),
        ),
      ),
      body: new Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            new FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () async {
                DateTime _dateTime = new DateTime.now();
                var _picked = await showDatePicker(
                  context: context,
                  initialDate: _dateTime,
                  firstDate: new DateTime(2000),
                  lastDate: new DateTime(2050),
                );
                this._picked = (_picked != null) ? _picked : this._picked;
                setState(() {});
              },
              child: SizedBox(
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 0),
                      child: Icon(Icons.calendar_today),
                    ),
                    Text(formatter.format(_picked)),
                  ],
                ),
              ),
            ),
            new FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              child: SizedBox(
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 0),
                      child: Icon(Icons.access_alarm),
                    ),
                    Text("data"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.ac_unit),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
