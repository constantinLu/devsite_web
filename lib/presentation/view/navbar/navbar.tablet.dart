// class _NavBarTablet extends StatelessWidget {
//   const _NavBarTablet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final drawerProvider = Provider.of<DrawerProvider>(context);
//     var theme = Theme.of(context);
//     return Container(
//       color: theme.navBarColor,
//       padding: EdgeInsets.symmetric(
//           horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
//       child: Row(
//         children: [
//           IconButton(
//             highlightColor: Colors.white54,
//             onPressed: () {
//               drawerProvider.key.currentState!.openDrawer();
//             },
//             icon: const Icon(Icons.menu),
//           ),
//           Space.xm!,
//           const NavBarLogo(),
//           // Space.x1!,
//         ],
//       ),
//     );
//   }
// }