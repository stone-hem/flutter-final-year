import 'package:finalyear/screens/firms/firms.dart';
import 'package:finalyear/screens/services/services.dart';
import 'package:finalyear/screens/size_constants.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:finalyear/screens/technicians/technicians.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token = '';
  String username = '';
  String userId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  void getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      token = preferences.getString("token")!;
      username = preferences.getString("username")!;
      userId = preferences.getString("id")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center, //center content
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_open_sharp,
                        color: Color(0xFF363f93),
                      )),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 214, 190, 118),
                    backgroundImage: AssetImage('images/sngmechanic.png'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Image.asset(
                      'images/top_stack.jpeg',
                    ),
                  ),
                  Positioned(
                    left: SizeConfig.blockSizeHorizontal! * 30,
                    top: 0,
                    bottom: SizeConfig.blockSizeVertical! * 9,
                    right: SizeConfig.blockSizeHorizontal! * 28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hello",
                              style: sourceFontMedium.copyWith(
                                fontSize: 18,
                                color: const Color(0xFF363f93),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              username,
                              style: sourceFontBold.copyWith(
                                fontSize: 18,
                                color: Color(0xFF363f93),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Hey there welcome to our application😊",
                          style: sourceFontRegular.copyWith(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
              height: 30,
              child: Row(
                children: [
                  Text(
                    "We Offer!",
                    style: sourceFontBold.copyWith(
                      fontSize: 18,
                      color: Color(0xFF363f93),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 169,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [_services(), _firms(), _technicians()],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
              height: 30,
              child: Row(
                children: [
                  Text(
                    "More",
                    style: sourceFontBold.copyWith(
                      fontSize: 18,
                      color: Color(0xFF363f93),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 10,
                    color: Colors.black12,
                  ),
                  Container(
                    height: 10,
                    color: Colors.black12,
                  ),
                  Container(
                    height: 10,
                    color: Colors.black12,
                  ),
                  Container(
                    height: 10,
                    color: Colors.black12,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //functions to en code

  _services() {
    return Container(
      height: 169,
      width: 150,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "images/service.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF363f93)),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363f93),
                        // shape: CircleBorder(),
                        padding: EdgeInsets.all(0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Service()));
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: Text('Services')),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("All kinds of services")
        ],
      ),
    );
  }

  _firms() {
    return Container(
      height: 169,
      width: 150,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "images/firm1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF363f93)),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363f93),
                        // shape: CircleBorder(),
                        padding: EdgeInsets.all(0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Firm()));
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: Text('Firms')),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("All kinds of firms")
        ],
      ),
    );
  }

  _technicians() {
    return Container(
      height: 169,
      width: 150,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 15,right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "images/firm1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF363f93)),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363f93),
                        // shape: CircleBorder(),
                        padding: EdgeInsets.all(0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Technician()));
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: Text('Technicians')),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("All Technicians")
        ],
      ),
    );
  }
}
