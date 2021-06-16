import 'package:flutter/material.dart';
import 'package:todoapp/PasswordChangedSuccessfully.dart';
import 'PasswordChangedSuccessfully.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: resetPassword(),
    );
  }
}

class resetPassword extends StatefulWidget {

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
              color: Colors.black
          ), onPressed: () {  },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Reset Password", style: TextStyle(
                  fontSize: 35
              ),),
              Text("Reset code was sent to your mail Id. Please enter the code and create a new password", style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
              ),),
              SizedBox(height: 20,),

              //Resetコードを入力させるTextField
              Text("Reset code", style: TextStyle(
                  fontSize: 23
              ),),
              TextField(
                decoration: InputDecoration(
                    hintText: "****"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 40,),

              //Passwordコードを入力させるTextField
              Text("Password", style: TextStyle(
                  fontSize: 23
              ),),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Password here"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 40,),

              //もう一度Passwordコードを入力させるTextField
              Text("Confirm Password", style: TextStyle(
                  fontSize: 23
              ),),
              TextField(
                decoration: InputDecoration(
                    hintText: "Re-Enter your Password here"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),

              //SendRequestボタン
              Expanded(
                child: Center(
                    child: InkWell(
                      onTap: openSuccessPage,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            color: Color(0xfff96060)
                        ),
                        child: Text("Change Password", style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),),
                      ),
                    )
                ),
              )
            ],
          )
      ),
    );
  }

  //PasswordChangedSuccessfully.dartへ
  void openSuccessPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordChangedSuccessfully()));

  }
}

