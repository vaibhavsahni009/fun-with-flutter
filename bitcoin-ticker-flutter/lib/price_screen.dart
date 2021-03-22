import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'networking.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String BTC = null;
  String ETH = null;
  String XRP = null;
  String selectedCurrency = currenciesList[0];

  Widget androidDropdownMenu() {
    List<DropdownMenuItem> dropdownList = [];
    for (String i in currenciesList) {
      dropdownList.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    }
    return DropdownButton(
        value: selectedCurrency,
        items: dropdownList,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getPrice();
          });
        });
  }

  Widget iosPicker() {
    List<Widget> pickerList = [];
    for (String i in currenciesList) {
      pickerList.add(Text(i));
    }
    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          selectedCurrency = currenciesList[selectedIndex];
          getPrice();
        },
        children: pickerList);
  }

  void getPrice() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.nomics.com/v1/currencies/ticker?key=990c0953ec92396f9c9909f69dcb32fe&ids=BTC,ETH,XRP&interval=1d&convert=$selectedCurrency');
//    print('getting data');
    var priceData = await networkHelper.getData();
    setState(() {
      BTC = priceData[0]['price'];

      ETH = priceData[1]['price'];
      XRP = priceData[2]['price'];
    });
  }

  @override
  void initState() {
    getPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $BTC $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETG = $ETH $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 XRP = $XRP $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdownMenu(),
          ),
        ],
      ),
    );
  }
}
