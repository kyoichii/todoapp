import 'package:flutter/material.dart';
import 'LoginPage.dart';

class Onbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: onbording(),
    );
  }
}

class onbording extends StatefulWidget {
  @override
  _onvordingState createState() => _onvordingState();
}

class _onvordingState extends State<onbording> {

  int currentPage = 0;
  PageController _pageController = new PageController(
      initialPage: 0,
      keepPage: true
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    //Colum onBoardPageに下記内容を送る
                    onBoardPage("onboard1", "Welcome to Aking"),
                    onBoardPage("onboard2", "Works Happens"),
                    onBoardPage("onboard3", "Task and Assignmets"),
                  ],
                  onPageChanged: (value) =>{setCurrentPage(value)},
                ),
              ),
              /*
              説明の下にあるTabのやつの表示
               */
              Row(
                //getIndicatorに値を送りそこでデザインを作成している
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              )
            ],
          ),
          /*
          画面の下に画像とその画像の上にボタンを配置させる
           */
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/image/path1.png'),
                    fit: BoxFit.fill
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0,9),
                          blurRadius: 20,
                          spreadRadius: 3
                        )]
                      ),
                      child: Text("Get Started", style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Login", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  //Tabのデザインを作っているgetIndicator
  AnimatedContainer getIndicator(int pageNo){
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == pageNo) ? Colors.black : Colors.grey
      ),
    );
  }

  //送られてきた処理
  Column onBoardPage(String img, String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*
          画像を出力させるレイアウト
         */
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/$img.png')
            )
          ),
        ),
        /*
          画像の名前を出力させるレイアウト
         */
        SizedBox(height: 50,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500
          ),),
        ),
        /*
          画像の名前の説明を出力させるレイアウト
         */
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text("Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the indestry's standard dummy text", style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),textAlign: TextAlign.center,),
        )
      ],
    );
  }
  setCurrentPage(int value){
    currentPage = value;
    setState(() {

    });
  }

  /*
  ログインぺージへ
   */
  openLoginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}






