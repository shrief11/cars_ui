import 'package:cars_ui/models/category_buttons.dart';
import 'package:cars_ui/pages/product%20page.dart';
import 'package:cars_ui/screen_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cars_ui/constants/style.dart';
import 'package:cars_ui/models/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false; // Variable to track theme mode

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle the theme
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double bannerHeight = screenWidth < 600
        ? 150
        : screenWidth < 1200
        ? 200
        : 250; // Responsive heights

    List<String> carImages = [
      'assets/images/bmw.jpg',
      'assets/images/gelly.png',
      'assets/images/jeep.png',
      'assets/images/Mercedes.jpg',
      'assets/images/dai.png',
      'assets/images/lotus.jpeg',
    ];

    List<Map<String, dynamic>> carData = [
      {
        'icon': Icons.safety_check,
        'label': 'مكفوله ل',
        'value': '2024',
      },
      {
        'icon': Icons.speed,
        'label': 'كم',
        'value': '20,000',
      },
      {
        'icon': Icons.calendar_today,
        'label': 'سنة الصنع',
        'value': '2022',
      },
      {
        'icon': Icons.money,
        'label': 'السعر',
        'value': '12,700 د.ك',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTop,
        leading: IconButton(
          icon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              'assets/icons/notifications.svg',
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: SizedBox(
              width: 22,
              height: 22,
              child: SvgPicture.asset(
                'assets/icons/mmenu.svg',
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: toggleTheme, // Toggle theme when pressed
          ),
        ],
      ),
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white, // Change background color based on theme
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stories(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0.0),
                child: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: bannerHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'ابحث عن سيارتك',
                    hintStyle: TextStyle(color: isDarkMode ? Colors.grey[300] : Colors.grey),
                    suffixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: isDarkMode ? Colors.white : Colors.black,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
              const CategoryButtons(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth < 600 ? 2 : 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: carImages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                changeScreen(context, const Product());
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    carImages[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 140,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var data in carData)
                                  Column(
                                    children: [
                                      Icon(data['icon'], color: isDarkMode ? Colors.blue[200] : Colors.blue, size: 16),
                                      const SizedBox(height: 2),
                                      Text(data['label'], style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white : Colors.black)),
                                      Text(data['value'], style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white : Colors.black)),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  'assets/images/footer.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// import 'package:cars_ui/models/category_buttons.dart';
// import 'package:cars_ui/pages/product%20page.dart';
// import 'package:cars_ui/screen_navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:cars_ui/constants/style.dart';
// import 'package:cars_ui/models/stories.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     final double bannerHeight = screenWidth < 600
//         ? 150
//         : screenWidth < 1200
//         ? 200
//         : 250; // Responsive heights
//
//     // List of images for the cards
//     List<String> carImages = [
//       'assets/images/bmw.jpg',
//       'assets/images/gelly.png',
//       'assets/images/jeep.png',
//       'assets/images/Mercedes.jpg',
//       'assets/images/dai.png',
//       'assets/images/lotus.jpeg',
//     ];
//
//     // Sample data for icons and texts
//     List<Map<String, dynamic>> carData = [
//       {
//         'icon': Icons.safety_check,
//         'label': 'مكفوله ل',
//         'value': '2024',
//       },
//       {
//         'icon': Icons.speed,
//         'label': 'كم',
//         'value': '20,000',
//       },
//       {
//         'icon': Icons.calendar_today,
//         'label': 'سنة الصنع',
//         'value': '2022',
//       },
//       {
//         'icon': Icons.money,
//         'label': 'السعر',
//         'value': '12,700 د.ك',
//       },
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kTop,
//         leading: IconButton(
//           icon: SizedBox(
//             width: 25,
//             height: 25,
//             child: SvgPicture.asset(
//               'assets/icons/notifications.svg',
//               colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//             ),
//           ),
//           onPressed: () {},
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: SizedBox(
//               width: 22,
//               height: 22,
//               child: SvgPicture.asset(
//                 'assets/icons/mmenu.svg',
//                 colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//               ),
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stories(),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 0.0),
//                 child: Image.asset(
//                   'assets/images/banner.png',
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: bannerHeight,
//                 ),
//               ),
//               // Search Field with Black Frame
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     hintText: 'ابحث عن سيارتك',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     suffixIcon: const Icon(Icons.search),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 2.0,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
//                   ),
//                 ),
//               ),
//               const CategoryButtons(),
//
//               // Responsive Cards Layout
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     return GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: constraints.maxWidth < 600 ? 2 : 3,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 0,
//                         childAspectRatio: 0.75,
//                       ),
//                       itemCount: carImages.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 changeScreen(context, const Product());
//                               },
//                               child: Card(
//                                 elevation: 4,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   child: Image.asset(
//                                     carImages[index],
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                     height: 140, // Increased height for the image
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 0), // Removed space between card and icons/text
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center icons/text
//                               children: [
//                                 for (var data in carData)
//                                   Column(
//                                     children: [
//                                       Icon(data['icon'], color: Colors.blue, size: 16),
//                                       const SizedBox(height: 2),
//                                       Text(data['label'], style: const TextStyle(fontSize: 10)),
//                                       Text(data['value'], style: const TextStyle(fontSize: 10)),
//                                     ],
//                                   ),
//                               ],
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               // Footer Banner
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Image.asset(
//                   'assets/images/footer.png',
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 150,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


