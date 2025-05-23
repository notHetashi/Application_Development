import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/lseth.jpg'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Seth Lavarro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'seth.angus25@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Edit profile logic
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingItem(
              context,
              Icons.person,
              'Personal Information',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.location_on,
              'Shipping Addresses',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.payment,
              'Payment Methods',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.history,
              'Order History',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.notifications,
              'Notifications',
                  () {},
            ),
            const Divider(),
            _buildSettingItem(
              context,
              Icons.help,
              'Help & Support',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.info,
              'About',
                  () {},
            ),
            _buildSettingItem(
              context,
              Icons.logout,
              'Logout',
                  () {
                // Logout logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully'),
                  ),
                );
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
      BuildContext context,
      IconData icon,
      String title,
      VoidCallback onTap, {
        Color? color,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF232A35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: color ?? const Color(0xFF0D8AFF),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.white,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFFB0B8C1)),
        onTap: onTap,
      ),
    );
  }
}
