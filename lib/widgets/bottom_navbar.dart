import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key,required this.screen});

  final String screen;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
        height: 57,
        color: const Color(0xffE6FAFD),
        elevation: 0,
        child: SizedBox(
          height: 50,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  if(screen!="Home")
                  {
                    GoRouter.of(context).pushNamed("Home Screen");
                  }
                },
                child: Icon(
                  Icons.home,
                  size: 40,
                  color: (screen=="Home")?const Color(0xff04434E):const Color(0xff0CC0DF),
                ),
              ),
              InkWell(
                onTap: (){
                  if(screen!="Dhwani")
                  {
                    GoRouter.of(context).pushNamed("Dhwani Screen");
                  }
                },
                child: (screen=="Dhwani")?Image(image: AssetImage("assets/dhwaninavdark.png")):Image(image: AssetImage("assets/dhwaninavlight.png"))
              ),
              InkWell(
                onTap: (){
                  if(screen!="Mock")
                    {
                      GoRouter.of(context).pushNamed("Mock Test");
                    }
                },
                child:  (screen=="Mock")?Image(image: AssetImage("assets/mocknavdark.png")):Image(image: AssetImage("assets/mocknavlight.png")),
              ),
              InkWell(
                onTap: (){
                  if(screen!="Profile")
                  {
                    GoRouter.of(context).pushNamed("Profile");
                  }
                },
                child: Icon(
                  CarbonIcons.user_filled,
                  size: 34,
                  color:(screen=="Profile")?const Color(0xff04434E):const Color(0xff0CC0DF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
