enum AppRouter {
  location('/location', "Location");
  final String path;
  final String name;
  final bool? isBottomNavigation;

  const AppRouter(this.path, this.name, {this.isBottomNavigation = false});

}