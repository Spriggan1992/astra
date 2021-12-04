import 'package:flutter/material.dart';

class MessageLitTile extends StatelessWidget {
  const MessageLitTile({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: (selected) ? Color.fromRGBO(240, 241, 243, 1) : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            onTap: onTap,
            // isThreeLine: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            leading: CircleAvatar(
                backgroundImage: Image.asset('assets/right_girl.png').image),
            title: Text(
              'Анастасия',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(24, 24, 24, 1)),
            ),
            subtitle: Text(
              'Приготовила пирог. Залетай, орел! И когда загремел гром, начнется дождь.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(24, 24, 24, 0.6),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('12:45'),
                Visibility(
                  visible: selected,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: Color.fromRGBO(24, 38, 71, 0.6),
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Color.fromRGBO(251, 251, 251, 1),
                          fontSize: 8,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromRGBO(24, 24, 24, 0.1),
          )
        ],
      ),
    );
  }
}
