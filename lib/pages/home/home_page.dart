import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_sol/utils/my_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const labelList = [
    'Celsius To Fahrenheit',
    'Celsius To Kelvin',
    'Fahrenheit To Celsius',
    'Fahrenheit To Kelvin',
    'Kelvin To Celsius',
    'Kelvin To Fahrenheit',
  ];
  var _feedbackText = '';
  final _controler = TextEditingController();

  void _handleClickButton(int i) {
    var input = _controler.text;
    var temp = double.tryParse(input);
    if(temp == null){
      setState((){
        _feedbackText = 'ผิดพลาดกรุณากรอกตัวเลข';
      });
      return;
    }
    switch (i) {
      case 0: //Celsius To Fahrenheit
         setState(() {
           _feedbackText = '$temp C = ${MyConverter.C2F(temp)} F';
         });
        break;
      case 1: //Celsius To Kelvin
        setState(() {
          _feedbackText = '$temp C = ${MyConverter.C2K(temp)} K';
        });
        break;
      case 2: //Fahrenheit To Celsius
        setState(() {
          _feedbackText = '$temp F = ${MyConverter.F2C(temp)} C';
        });
        break;
      case 3: //Fahrenheit To Kelvin
        setState(() {
          _feedbackText = '$temp F = ${MyConverter.F2K(temp)} K';
        });
        break;
      case 4:
        setState(() {
          _feedbackText = '$temp K = ${MyConverter.K2C(temp)} C';
        });
        break;
      case 5:
        setState(() {
          _feedbackText = '$temp K = ${MyConverter.K2F(temp)} F';
        });
        break;
    }
  }

  Widget _buildButton(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _handleClickButton(i);
        },
        child: Text(labelList[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "แปลงหน่วยอุณภูมิ",
              style: GoogleFonts.kanit(
                fontSize: 30.0,
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              //color: Colors.amberAccent.withOpacity(0.5),
              color: Colors.amber.shade400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controler,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // _buildButton('C To F'),
                  //     // _buildButton('C To K'),
                  //
                  //   ],
                  //
                  // // Padding(
                  // //      padding: const EdgeInsets.all(8.0),
                  // //      child: ElevatedButton(onPressed: null, child: Text('xxx')),
                  // // ),
                  // ),
                  //SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(0),
                      _buildButton(1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                    ],
                  ),
                  //SizedBox(height: 10.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     for(var r in myList)
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           for(var i  in r)
                  //             _buildButton(i)
                  //         ],
                  //       ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Text(
              _feedbackText,
              style: GoogleFonts.sarabun(fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
