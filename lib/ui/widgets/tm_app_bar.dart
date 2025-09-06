import 'package:flutter/material.dart';
import 'package:hyip/ui/controllers/auth_controller.dart';
import 'package:hyip/ui/screens/login_screen.dart';
import 'package:hyip/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({super.key, this.fromProfileScreen});

  final bool? fromProfileScreen;

  void _onTapProfileSection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UpdateProfileScreen()),
    );
  }

 Future<void> _onTapLogoutButton(BuildContext context) async{
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (predicate) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            return;
          }
          _onTapProfileSection(context);
        },
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fulName ?? '',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    AuthController.userModel?.email ?? 'Unknown',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _onTapLogoutButton(context),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
