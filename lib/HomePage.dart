import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEPT", "OCT", "NOV", "DEC"];
  CalendarController ctrlr = new CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text("Work List", style: TextStyle(
                  fontSize: 30
                ),),
                actions: [
                  IconButton(
                    icon: Icon(Icons.short_text,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {  },
                  )
                ],
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //todayバー
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){changeFilter("today");},
                          child: Text("Today", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "today")?Colors.white:Colors.transparent,
                        ),
                      ],
                    ),
                    //Monthlyバー
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){changeFilter("monthly");},
                          child: Text("Monthly", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "monthly")?Colors.white:Colors.transparent,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //filterTypeがmonthlyだった場合
              (filterType == "monthly")?TableCalendar(
                calendarController: ctrlr,
                startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.week,
              ):Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}", style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey
                            ),)
                          ],
                        ),
                      ),
                      //taskWidget(Color(0xfff96060), "Meeting with someone", "9:00 AM"),
                      //taskWidget(Colors.blue, "Meeting with someone", "9:00 AM"),
                      //taskWidget(Colors.green, "Take your medicines", "9:00 AM"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  changeFilter(String filter){
    filterType = filter;
    setState(() {
    });
  }

}






