import 'package:flutter/material.dart';

// Define the tropicalIndigo color if not already defined
const Color lightGray = Color(0xFFB0B0B0);
const Color redColor = Color(0xFFFF0000);
const Color darkGray = Color(0xFF707070);
const Color tropicalIndigo = Color(0xFF9479F3); // Add this if not defined
const Color activeColor = Color(0xFF4CAF50); // Green or any color for active status
const Color inactiveColor = Color(0xFF9E9E9E); // Gray or any color for inactive status

class TeacherCard extends StatelessWidget {
  final Map<String, String> teacher;

  const TeacherCard({required this.teacher, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the color based on status
    Color statusColor;
    if (teacher['Status'] == 'Active') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: tropicalIndigo,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Make the image size responsive
              Container(
                height: screenWidth * 0.15, // 15% of screen width
                width: screenWidth * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: tropicalIndigo,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(teacher['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7),
                    // Combine first name and last name
                    Text(
                      '${teacher['firstName']} ${teacher['lastName']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: screenWidth * 0.030, // Responsive font size
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      teacher['email']!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.025,
                        color: tropicalIndigo,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          teacher['phone']!,
                          style: TextStyle(
                            fontSize: screenWidth * 0.025,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(ID: ${teacher['id']!})',
                          style: TextStyle(
                            fontSize: screenWidth * 0.02,
                            color: lightGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Row(
                    children: [
                      _buildActionIcon(Icons.remove_red_eye, redColor),
                      const SizedBox(width: 5),
                      _buildActionIcon(Icons.edit, tropicalIndigo),
                      const SizedBox(width: 5),
                      _buildActionIcon(Icons.delete, darkGray),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: screenWidth * 0.15, // 25% of screen width
                    height: screenWidth * 0.05, // Adjust height for mobile
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '${teacher['Status']}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.black12),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoLabel("Experience", teacher['experience']!, screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15, // 20% of screen width
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Gender", teacher['gender']!, screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15,
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Marital Status", teacher['maritalStatus']!, screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15,
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Qualification", teacher['qualification']!, screenWidth),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }

  Widget _buildInfoLabel(String label, String value, double screenWidth) {
    return Container(
      width: screenWidth * 0.17, // Make the width responsive
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.022, // Responsive font size
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: lightGray,
              fontSize: screenWidth * 0.020,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}




class StudentCard extends StatelessWidget {
  final Map<String, String> studentData;

  const StudentCard({required this.studentData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the color based on status
    Color statusColor;
    if (studentData['status'] == 'Active') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF9479F3), // Use the same color as tropicalIndigo
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder for student image; adjust as necessary
              Container(
                height: screenWidth * 0.15,
                width: screenWidth * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFF9479F3),
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(studentData['image'] ?? 'assets/images/default_student.png'), // Default image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7),
                    // Combine first name and last name
                    Text(
                      '${studentData['firstName']} ${studentData['lastName']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: screenWidth * 0.030,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      studentData['email'] ?? '',
                      style: TextStyle(
                        fontSize: screenWidth * 0.025,
                        color: const Color(0xFF9479F3), // Use the same color as tropicalIndigo
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          studentData['phone'] ?? '',
                          style: TextStyle(
                            fontSize: screenWidth * 0.025,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(ID: ${studentData['id']})',
                          style: TextStyle(
                            fontSize: screenWidth * 0.02,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Row(
                    children: [
                      _buildActionIcon(Icons.remove_red_eye, Colors.red), // Change colors if needed
                      const SizedBox(width: 5),
                      _buildActionIcon(Icons.edit, const Color(0xFF9479F3)),
                      const SizedBox(width: 5),
                      _buildActionIcon(Icons.delete, Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.05,
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '${studentData['status']}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.black12),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoLabel("Gender", studentData['gender']!, screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15, // 20% of screen width
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Mobile", studentData['phone']!, screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15, // 20% of screen width
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Grade", studentData['grade'] ?? 'N/A', screenWidth),
              DashedVerticalDivider(
                height: screenWidth * 0.15, // 20% of screen width
                width: 2,
                dashWidth: 5,
                dashSpacing: 4,
                color: tropicalIndigo,
              ),
              _buildInfoLabel("Religion", studentData['religion']!, screenWidth),// Adjust field as necessary
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }

  Widget _buildInfoLabel(String label, String value, double screenWidth) {
    return Container(
      width: screenWidth * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.022,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: screenWidth * 0.020,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class DashedVerticalDivider extends StatelessWidget {
  final double height;
  final double width;
  final double dashWidth;
  final double dashSpacing;
  final Color color;

  const DashedVerticalDivider({
    required this.height,
    required this.width,
    required this.dashWidth,
    required this.dashSpacing,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: List.generate(
          (height / (dashWidth + dashSpacing)).floor(),
              (index) => Container(
            height: dashWidth,
            width: width,
            color: color,
            margin: EdgeInsets.only(bottom: dashSpacing),
          ),
        ),
      ),
    );
  }
}
