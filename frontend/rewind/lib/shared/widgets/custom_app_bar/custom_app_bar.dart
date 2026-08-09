import 'package:flutter/material.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/notification_icon/notification_icon.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {


  final String logo = 'lib/assets/rewind_logo.png';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.white,
      leading: Image(
        image: AssetImage(logo),
      ),

      elevation: 0,

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: NotificationIcon(
            isNotification: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: AppTheme.themeAccent,
            child: Icon(Icons.person, color: AppTheme.theme,),
          ),
        )
      ],
    );
  }
}

