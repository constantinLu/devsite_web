class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String services = '/services';
  static const String showcase = '/showcase';
  static const String contact = '/contact';

  static int sectionFor(String routeName) {
    switch (routeName) {
      case about:
        return 0;
      case services:
        return 1;
      case showcase:
        return 2;
      case contact:
        return 3;
      case home:
      default:
        return 0;
    }
  }

  static String pathForSection(int index) {
    switch (index) {
      case 0:
        return about;
      case 1:
        return services;
      case 2:
        return showcase;
      case 3:
        return contact;
      default:
        return home;
    }
  }
}
