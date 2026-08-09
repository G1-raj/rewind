import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final bool isNotification;
  const NotificationIcon(
    {
      super.key,
      this.isNotification = false
    }
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.notifications_outlined),

        if(isNotification)
          Positioned(
            top: 0,
            right: 0,
            child: notificationDot(),
          )
      ],
    );
  }

  Widget notificationDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle
      ),
    );
  }
}