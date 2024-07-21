import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('KEKOMARZ'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Logout', style: TextStyle(color: Colors.black)),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/motorcycle.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: isLandscape ? 200 : 300,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'MOTORCYCLE PARTS AND ACCESSORIES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/product-list');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('View Products'),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          const url = 'https://www.facebook.com/kekomarz';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueGrey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Visit Our Facebook Page'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'We Have Available Parts For :',
                    style: TextStyle(
                        fontSize: isLandscape ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      BrandCard(
                          brandName: 'DUCATI', imageUrl: 'assets/ducati.png'),
                      BrandCard(
                          brandName: 'Harley Davidson',
                          imageUrl: 'assets/custom.png'),
                      BrandCard(brandName: 'BMW', imageUrl: 'assets/bmw.png'),
                      BrandCard(
                          brandName: 'YAMAHA', imageUrl: 'assets/yamaha.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to KEKOMARZ Motor Shop',
                        style: TextStyle(
                            fontSize: isLandscape ? 18 : 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Where passion meets precision! Founded by Kim Jonathan Agojo, our shop has earned prestigious awards for the best design and quality of service in motor shows. At KEKOMARZ, we pride ourselves on delivering top-notch motor repair and customization services, ensuring your ride not only looks great but performs flawlessly. Whether you\'re looking for a quick tune-up or a complete overhaul, our expert team is dedicated to providing exceptional care and attention to detail. Join our family of satisfied customers and experience the KEKOMARZ difference today—where excellence is not just a goal, but a guarantee!',
                        style: TextStyle(
                            fontSize: isLandscape ? 14 : 16, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Located at:',
                        style: TextStyle(
                            fontSize: isLandscape ? 16 : 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Orchid 4211, San Jacinto, Agoncillo, Batangas',
                        style: TextStyle(fontSize: isLandscape ? 14 : 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Contact Number:',
                        style: TextStyle(
                            fontSize: isLandscape ? 16 : 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '09759486842',
                        style: TextStyle(fontSize: isLandscape ? 14 : 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final String brandName;
  final String imageUrl;

  BrandCard({required this.brandName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageUrl,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(brandName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
