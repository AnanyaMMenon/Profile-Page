import 'package:flutter/material.dart';
import 'user_info.dart';
import 'user_info_page.dart';

void main() {
  UserInfo userInfo = UserInfo(
    name: 'Ananya Menon',
    position: 'Software Engineer Intern',
    company: 'CDK Global',
    phone: '(872) 294-7498',
    email: 'amenon13@hawk.iit.edu',
    address: 'Lake Meadows, Chicago 60616',
    profilePicture: 'assets/images/profilePic.jpg', 
    education: [
      Education(institution: 'Illinois Institute of Tech, MS in CS', logo: 'assets/images/iit.jpg', gpa: 3.4),
      Education(institution: 'Dayanand Sagar University, BE in ECE', logo: 'assets/images/DSU.png', gpa: 3.8),
    ],
    workExperience: [
      Project(title: 'CDK Global', image: 'assets/images/cdk.png'),
      Project(title: 'Chevron', image: 'assets/images/chevron-logo.png'),
      Project(title: 'LTIMindtree', image: 'assets/images/lti.png'),
    ],
    projects: [
      Project(title: 'Bus Ticket Reservation Website', image: 'assets/images/bus.png'),
      Project(title: 'CI/CD Pipeline for Web Apps', image: 'assets/images/cloud.jpg'),
      Project(title: 'AI Chatbot with OpenAI', image: 'assets/images/ai.jpg'),
      Project(title: 'Database Management System', image: 'assets/images/DBMS.jpg'),
    ],
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      // For newer versions of Flutter, define the secondary (accent) color via colorScheme:
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(secondary: Colors.amber),
    ),
    home: UserInfoPage(userInfo: userInfo),
  ));
}
