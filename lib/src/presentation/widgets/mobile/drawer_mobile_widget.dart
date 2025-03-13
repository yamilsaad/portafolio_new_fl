import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMobileWidget extends StatelessWidget {
  const DrawerMobileWidget({
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
      width: screenWidth * 0.9,
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
              ),
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/img/logo/logo_trans.webp'),
                image: AssetImage('assets/img/logo/logo_trans.webp'),
                fit: BoxFit.contain,
              ),
            ),
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
                  size: _screenWidth * 0.05,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Get My Quote',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.05),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.05,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: _screenWidth * 0.05,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Our Clients',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.05),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.05,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.comment,
                  size: _screenWidth * 0.05,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Get My Advisor',
                  style: TextStyle(
                      fontFamily: 'AtkinsonHyperlegibleNext',
                      fontSize: _screenWidth * 0.05),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.05,
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
