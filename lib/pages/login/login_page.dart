import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_sol/pages/main/main_page.dart';
import 'package:midterm_sol/utils/helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _input = '';
  var _message = '';
  Widget _buildIndicator(bool on) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xFF00CC33),
            width: 1.0,
          ),
          color: on ? Colors.green : Colors.transparent,
        ),
      ),
    );
  }

  void _handleClickButton(int num) {
    const password = '123456';
    setState(() {
      if (num == -1) {
        _input = _input.substring(0, _input.length - 1);
      } else {
        _input = _input + num.toString();
      }
    });
    if (_input.length == 6) {
      //ตรวจสอบรหัสผ่านว่าถูกต้องหรือไม่
      if (_input == password) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
        // setState(() {
        //   _message = 'ยินดีต้อนรับสู่ Mobile banking';
        // });
      } else {
        showMyDialog(context, 'Sorry', 'Incorrect PIN ,Please try again');
        setState(() {
          _message = '';
        });
      }
    }
  }

  // การสร้างฟังก์ชันในรูปแบบ function declaration
  void func1() {
    var myList = [1, 2, 3, 'Hello'];
  }

  //การสร้างฟังก์ชันในรูปแบบนิพจน์ฟังก์ชัน function expression
  var func2 = () {
    //
  };

  void func3() {
    func1();
    func2();
    var f = func2;
    f();
  }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // onTap: (){ //callback function, event listener/handler
        //   setState(() {
        //     // _input = _input + num.toString();
        //   });
        // },
        onTap: () {
          _handleClickButton(num);
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: num != -1
                ? Border.all(
                    color: Color(0xFF333333),
                    width: 1.0,
                  )
                : null,
          ),
          child: num == -1
              ? Icon(Icons.backspace_outlined)
              : Text(
                  num.toString(),
                  style: GoogleFonts.firaCode(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var numberRow1 = [
      _buildNumberButton(1),
      _buildNumberButton(2),
    ];
    numberRow1.add(_buildNumberButton(3));

    var myList1 = [1, 2, 3];
    /*var myList2 = [];
    for(var i = 0; i < myList1.length; i++){
      myList2.add(myList1[i]);
    }
    myList2.add(4);
    */

    // Spread operator(...)
    var myList2 = [0, ...myList1, 4, 5, 6];

    /*var myList = <Widget>[];
    for(var i = 4; i <= 6; i++){
      myList.add(_buildNumberButton(i));
    }*/

    /*var list = [];
    for(var i = 1; i <= 100; i++){
      list.add(i);
    }*/
    var status = false;
    var list = [
      0,
      for (var i = 1; i <= 100; i++) i,
      101,
      102,
      103,
      if (status) 104,
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/K+.png',
            width: 120.0,
          ),
          Text('Please Enter Your PIN'),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIndicator(_input.length >= 1 ? true : false),
              _buildIndicator(_input.length >= 2 ? true : false),
              _buildIndicator(_input.length >= 3 ? true : false),
              _buildIndicator(_input.length >= 4 ? true : false),
              _buildIndicator(_input.length >= 5 ? true : false),
              _buildIndicator(_input.length >= 6 ? true : false),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: numberRow1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // children: myList,
                children: [
                  //collection for
                  for (var i = 4; i <= 6; i++) _buildNumberButton(i)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i in [7, 8, 9]) _buildNumberButton(i)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 76.0,
                    height: 76.0,
                  ),
                  _buildNumberButton(0),
                  _buildNumberButton(-1),
                ],
              )
            ],
          ),
          // Text(_input),
          // Text(_message),
        ],
      ),
    );
  }
}
