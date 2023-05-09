import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'NETFLIX',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 192, 31, 31),
                fontSize: 30),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 40, 20, 20), // set the background color to black
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.network(
                'https://assets.nflxext.com/ffe/siteui/vlv3/61e79073-50cf-4f7b-9a23-73290e6f7dca/47d0e139-0425-4ecb-87cd-d40b020f35aa/UA-en-20230410-popsignuptwoweeks-perspective_alpha_website_large.jpg', // replace with your photo file path
               // width: 420, // adjust the width as needed
               // height: 700, // adjust the height as needed
                fit: BoxFit
                    .cover, // adjust the fit property as needed to control how the photo is displayed
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                          Color.fromARGB(255, 148, 29, 29),
                          Colors.black87
                        ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                 // width: 300,
                 // height: 500,
                ),
              ),
            ),
            //   _HeaderWidget(),
            SizedBox(height: 30),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();
  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  bool? isChecked = false;
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (1==1) {
     errorText = null;
       Navigator.of(context).pushReplacementNamed('/main_screen');
     // print('open app');
    }
     else {
      errorText = 'Not valid login or password';
    }
    setState(() {});
  }

  // void _resetPassword() {
  //   print('reset password');
  // }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 246, 246, 246),
    );
    // ignore: constant_identifier_names
    const textFieldDecorator_first = InputDecoration(
         focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:Color.fromARGB(255, 36, 231, 10),
          
          width:3,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:Color.fromARGB(255, 99, 2, 2),
          width:3,
        )
      ),
      border: OutlineInputBorder(),
      fillColor: Color.fromARGB(255, 255, 255, 255),
      suffixText: AutofillHints.email,suffixStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      //t the suffix text color to white
      contentPadding: EdgeInsets.only(left: 10, right: 20),
      // Paddingpadding: EdgeInsets.only(top: 15.0, left: 10.0), ),
    );

// ignore: constant_identifier_names
    const textFieldDecorator_second = InputDecoration(
      // border: OutlineInputBorder(),
      // errorText: 'error text',
      //  focusedErrorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color:Color.fromARGB(255, 231, 10, 76),
      //     width:3,
      //   )
      // ),
      // //errorText: 'error text',
      //  errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color:Color.fromARGB(255, 10, 28, 231),
      //     width:3,
      //   )
      // ),
       focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:Color.fromARGB(255, 36, 231, 10),
          width:3,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:Color.fromARGB(255, 99, 2, 2),
          width:3,
        )
      ),
      // disabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.black,
      //   width:3.0,style:BorderStyle.solid),
      // ),
            suffixText: AutofillHints.password,suffixStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

   //  hintText: AutofillHints.password,labelStyle: TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
      hintStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255)), // set the suffix text color to white
      contentPadding: EdgeInsets.only(left: 10, right: 20),
    );
    final errorText = this.errorText;
// this line doesn't affect the suffix text color

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (errorText != null)
          Text(errorText, style: TextStyle(fontSize: 17, color: Colors.red)),
        SizedBox(height: 5),
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        const Text('UserName', style: textStyle),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: TextField(
            decoration: textFieldDecorator_first,
            style: textStyle.copyWith(
                color: Color.fromARGB(
                    255, 0, 0, 0)), // set the text color to white
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: TextField(
            decoration: textFieldDecorator_second,
            style: textStyle.copyWith(color: Color.fromARGB(255, 0, 0, 0)),
            obscureText: true, // set the text color to white
          ),
        ),
        SizedBox(height: 23),
        Center(
          child: TextButton(
            onPressed: _auth,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 180, 32, 21)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                //  borderRadius: BorderRadius.circular(18.0),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ))),
            child: const Text('Login'),
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                activeColor: Colors.black,
                tristate: true,
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                },
              ),
              const Text(
                'Remember me',
                style: TextStyle(color: Colors.white60),
              ),
              SizedBox(
                width: 35,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.pink),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                child: Text('Sign up now!'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'This page is protected by Google reCAPTCHA to ensure you\'re not a bot. ',
                        style: TextStyle(
                            color: Color.fromARGB(153, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.pink),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                      child: Text('Learn more!!'),
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}
