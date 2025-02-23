class Education {
  final String institution;
  final String logo;
  final double gpa;

  Education({required this.institution, required this.logo, required this.gpa});
}

class Project {
  final String title;
  final String image;

  Project({required this.title, required this.image});
}

class UserInfo {
  final String name;
  final String position;
  final String company;
  final String phone;
  final String email;
  final String address;
  final String profilePicture;
  final List<Education> education;
  final List<Project> workExperience;
  final List<Project> projects; 

  UserInfo({
    required this.name,
    required this.position,
    required this.company,
    required this.phone,
    required this.email,
    required this.address,
    required this.profilePicture,
    required this.education,
    required this.workExperience, 
    required this.projects, 
  });
}
