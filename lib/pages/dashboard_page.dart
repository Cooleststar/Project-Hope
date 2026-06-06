import 'package:flutter/material.dart';
import '../constants.dart';
import 'appointments_page.dart';
import 'chat_screen.dart';
import 'contact_us_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
                children: [
                  _buildDashboardCard(
                    context,
                    title: 'Appointments',
                    icon: Icons.people_outline,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentsPage())),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'Chat With Live Bot',
                    icon: Icons.chat_bubble_outline,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen())),
                  ),
                ],
              ),
            ),
            Center(
               child: _buildDashboardCard(
                  context,
                  title: 'Support',
                  icon: Icons.headset_mic_outlined,
                  width: MediaQuery.of(context).size.width * 0.45,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage())),
                ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap, double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkBlue)),
            const SizedBox(height: 20),
            Icon(icon, size: 80, color: Colors.black87),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.lightGray,
                  child: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkBlue)),
                    Text('Location Placeholder', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: AppColors.primaryPurple)),
              ],
            ),
          ),
          _buildDrawerItem(context, Icons.calendar_today, 'My Appointments', () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentsPage()))),
          _buildDrawerItem(context, Icons.add_circle_outline, 'New Appointment', () {}),
          _buildDrawerItem(context, Icons.chat_bubble_outline, 'Chat With Live Bot', () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()))),
          _buildDrawerItem(context, Icons.headset_mic_outlined, 'Support', () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()))),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryPink),
      title: Text(title, style: const TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
