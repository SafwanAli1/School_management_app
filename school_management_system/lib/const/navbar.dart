import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/screens/add_new_teacher.dart';
import 'package:school_management_system/screens/teacher_list.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Safwan'),
            accountEmail: Text('safwan@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/Profile.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover, // Ensures the image fills the avatar
                ),
              ),
            ),
          ),
          // Dashboard
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => null,
          ),
          // admin Dropdown
          ExpansionTile(
            leading: Icon(Icons.person_2),
            title: Text('Admin'),
            children: <Widget>[
              ListTile(
                title: Text('Add New Admin'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              ListTile(
                title: Text('View Admin List'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
            ],
          ),

          // Teacher Dropdown
          ExpansionTile(
            leading: Icon(Icons.person_2),
            title: Text('Teacher'),
            children: <Widget>[
              ListTile(
                title: Text('Add New List'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewTeacherPage(), // Navigate to AddNewTeacherPage
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('View Teacher List'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherList(), // Navigate to AddNewTeacherPage
                    ),
                  );
                },
              ),
            ],
          ),

          // Student Dropdown
          ExpansionTile(
            leading: Icon(Icons.person_2),
            title: Text('Student'),
            children: <Widget>[
              ListTile(
                title: Text('Add New Student'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              ListTile(
                title: Text('View Student List'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
            ],
          ),

          //Parent Dropdown
          ExpansionTile(
            leading: Icon(Icons.person_2),
            title: Text('Parent'),
            children: <Widget>[
              ListTile(
                title: Text('Add New Parent'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              ListTile(
                title: Text('View Parent List'),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
            ],
          ),

          //Academic
          ListTile(
            leading: Icon(Icons.tab),
            title: Text('Academics'),
            onTap: () => null,
          ),

          //Fees Collection
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Fees Collection'),
            onTap: () => null,
          ),

          // Examination
          ListTile(
            leading: Icon(Icons.tab),
            title: Text('Examination'),
            onTap: () => null,
          ),

          //Attendance
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Attendance'),
            onTap: () => null,
          ),

          //Communicate
          ListTile(
            leading: Icon(Icons.tab),
            title: Text('Communicate'),
            onTap: () => null,
          ),

          //Home Work
          ListTile(
            leading: Icon(Icons.home_work),
            title: Text('Homework'),
            onTap: () => null,
          ),

          // My Account
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text('My Account'),
            onTap: () => null,
          ),

          //Setting
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => null,
          ),

          //Change Password
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Change Password'),
            onTap: () => null,
          ),

          //Log Out
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
