import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWebWidget extends StatelessWidget {
  const DrawerWebWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0))),
      width: screenWidth * 0.5,
      child: Column(
        children: [
          SizedBox(height: _screenHeight * 0.03),
          Container(
              height: _screenHeight * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.mugHot,
                    size: _screenWidth * 0.05,
                  ),
                  Text(
                    '{Soy-Dev}',
                    style: TextStyle(
                        fontSize: _screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF14A00)),
                  )
                ],
              )

              /*ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
              ),
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/img/logo/logo_trans.webp'),
                image: AssetImage('assets/img/logo/logo_trans.webp'),
                fit: BoxFit.contain,
              ),
            ),*/
              ),
          Divider(
            height: _screenHeight * 0.02,
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.handshake,
                  size: _screenWidth * 0.025,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Get My Quote',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.025),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: _screenWidth * 0.025,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Our Clients',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.025),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.comment,
                  size: _screenWidth * 0.025,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Get My Advisor',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.025),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          Divider(
            height: _screenHeight * 0.02,
          ),
        ],
      ),
    );
  }
}
