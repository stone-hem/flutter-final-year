import 'package:finalyear/screens/size_constants.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/car-mechanic-concept-avatar-vector-illustration-graphic-design-135452405.jpg'),
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
                    left: SizeConfig.blockSizeHorizontal!*30,
                    top: 0,
                    bottom: SizeConfig.blockSizeVertical!*9,
                    right: SizeConfig.blockSizeHorizontal!*28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hello",
                              style: sourceFontMedium.copyWith(
                                fontSize: 18,
                                color: Color(0xFF363f93),
                              ),
                              ),
                              SizedBox(width: 5,),
                               Text(
                              "Stone",
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
            )
          ],
        ),
      ),
    );
  }
}
