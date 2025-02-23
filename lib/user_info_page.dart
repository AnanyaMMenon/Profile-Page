import 'package:flutter/material.dart';
import 'user_info.dart';

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInfo.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        // Background image for the entire screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/arrangement-with-pink-flowers-pink-background_23-2148104198.avif',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            buildHeaderSection(context),
            SizedBox(height: 16.0),
            buildContactSection(context),
            SizedBox(height: 16.0),
            buildEducationSection(context),
            SizedBox(height: 16.0),
            buildWorkExperienceSection(context),
            SizedBox(height: 16.0),
            buildProjectsSection(context),
          ],
        ),
      ),
    );
  }

  // Header Section with profile image and basic info
  Widget buildHeaderSection(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(userInfo.profilePicture),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfo.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            Text(
              userInfo.position,
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(
              userInfo.company,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ],
    );
  }

  // Contact Section
  Widget buildContactSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContactRow(Icons.phone, userInfo.phone),
          buildContactRow(Icons.email, userInfo.email),
          buildContactRow(Icons.location_on, userInfo.address),
        ],
      ),
    );
  }

  Widget buildContactRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  // Education Section
  Widget buildEducationSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[800],
            ),
          ),
          SizedBox(height: 8.0),
          Column(
            children: userInfo.education.map((edu) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Image.asset(edu.logo, width: 60, height: 70),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        edu.institution,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                    Text(
                      '${edu.gpa} GPA',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Work Experience Section (3 items per row)
  Widget buildWorkExperienceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red[800],
          ),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userInfo.workExperience.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final work = userInfo.workExperience[index];
            return buildGridCard(work);
          },
        ),
      ],
    );
  }

  // Projects Section (2 items per row)
  Widget buildProjectsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red[800],
          ),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userInfo.projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final project = userInfo.projects[index];
            return buildGridCard(project);
          },
        ),
      ],
    );
  }

  // Common Grid Card Widget for both Work Experience and Projects
  Widget buildGridCard(Project item) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.image.isNotEmpty
                ? Image.asset(
                    item.image,
                    width: 140, // Bigger width for the image
                    height: 140, // Bigger height for the image
                    fit: BoxFit.contain,
                  )
                : Icon(Icons.business, size: 80), // Bigger fallback icon size
            SizedBox(height: 6.0),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
