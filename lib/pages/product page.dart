//import 'package:cars_ui/pages/home.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('تفاصيل السيارة'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Car Image with Gradient Overlay
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/bmw.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Center(child: Text('صورة غير متوفرة')),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      height: 100, // Adjust the height as needed
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'بي ام دابليو بحالة جيده',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // Car Details Section
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailCard('الممشى', '2000', Icons.speed),
                        _buildDetailCard('سنة الصنع', '2019', Icons.calendar_today),
                        _buildDetailCard('الناقل', '6', 'assets/icons/transmission.png'),
                      ],
                    ),
                  ),
                ),

                // Price Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '8,700 د.ك ',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'بي ام دابليو بحالة جيده',
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'بكفالة حتى 70000 كم',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),

                // Car Features Section
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(7),
                    },
                    children: [
                      _buildFeatureRow('اللون الخارجي', 'أبيض', Icons.color_lens),
                      _buildFeatureRow('نوع القير', 'أوتوماتيك', Icons.settings),
                      _buildFeatureRow('كاميرا', 'أمامي وخلفي', Icons.camera_alt),
                    ],
                  ),
                ),

                // Car Description Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'مواصفات السيارة كاملة بما فيها مقاعد كهربائية، وسائد هوائية...',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                // Horizontal List of Other Cars
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCarCard('assets/images/lotus.jpeg', '2021', '12,700 د.ك'),
                      _buildCarCard('assets/images/gelly.png', '2020', '11,500 د.ك'),
                    ],
                  ),
                ),

                // Footer Buttons Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFooterButton('حجز السيارة'),
                      _buildFooterButton('موقع السيارة'),
                      IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a feature row
  TableRow _buildFeatureRow(String featureName, String featureValue, IconData icon) {
    return TableRow(
      children: [
        Icon(icon),
        Text('$featureName: $featureValue'),
      ],
    );
  }

  // Helper method to build a car detail card with asset icon
  Widget _buildDetailCard(String label, String value, dynamic icon) {
    return Column(
      children: [
        if (icon is IconData)
          Icon(icon, size: 40)
        else
          Image.asset(icon, width: 40, height: 40),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Helper method to build a car card for the horizontal list
  Widget _buildCarCard(String imagePath, String year, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(child: Text('صورة غير متوفرة')),
                  );
                },
              ),
            ),
            Text('سنة $year', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Helper method to build a styled footer button
  Widget _buildFooterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text),
    );
  }
}


