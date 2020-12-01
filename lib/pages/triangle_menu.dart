import 'package:flutter/material.dart';
import 'package:cryptconverter/layout.dart';
import 'package:cryptconverter/source_code/triangle_code.dart';

class TrianglePage extends StatefulWidget {
  @override
  _TrianglePageState createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final TextEditingController _textValue = TextEditingController();
  final TextEditingController _keyValue = TextEditingController();
  String _result = "";
  bool _switchValue = false;
  bool canShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
          child: Container(
              width: SizeConfig.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Text(
                    "TRIANGLE CIPHER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.greenAccent[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: SizeConfig.blockHorizontal * 90,
                    height: SizeConfig.blockVertical * 15,
                    child: Card(
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "CONVERT TYPE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  color: Colors.greenAccent[700],
                                  width: SizeConfig.blockHorizontal * 28,
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "ENCRYPT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Switch(
                                        value: _switchValue,
                                        activeColor: Colors.white,
                                        activeTrackColor: Colors.black54,
                                        inactiveThumbColor: Colors.white,
                                        inactiveTrackColor: Colors.black54,
                                        onChanged: (newValue) {
                                          _switchValue = newValue;
                                          setState(() {});
                                          
                                        }),
                                    Text(
                                      "DECRYPT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      color: Colors.blueGrey[900],
                      elevation: 4,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: SizeConfig.screenWidth * 0.85,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _textValue,
                      textCapitalization: TextCapitalization.characters,
                      cursorColor: Colors.greenAccent[700],
                      decoration: InputDecoration(
                        hintText: "INPUT TEXT HERE...",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent[700]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent[700]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: _triangleCipher,
                    child: Text("EXECUTE"),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                  ),
                  resultsWidget(_result),
                ],
              ))),
    );
  }

  void dispose() {
    _textValue.dispose();
    _keyValue.dispose();
    super.dispose();
  }
  
  void _triangleCipher() {
    var text = _textValue.text;
    TriangleCipher convert = new TriangleCipher();
    if(_switchValue == false){
      _result = convert.encrypt(text);
    }
    else{
      _result = convert.decrypt(text);
    }
    setState(() {
      if (_result == null || _result ==""){
        canShow = false;
      }
      else{
        canShow = true;
      }
    });
  }

  Widget resultsWidget(_result) {

    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: canShow
            ? Column(children: [
                Text("RESULT :",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent[700])),
                        SizedBox(height :10),
                Container(
                  width: SizeConfig.screenWidth*0.8,
                    child: Center(
                      child: Text(_result,
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))
                    )
              ])
            : Container());
  }
}

