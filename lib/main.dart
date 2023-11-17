import 'package:flutter/material.dart';

import 'animcontroller.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: MyAnimationControler(), // HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        leading: IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            // Handle filter option
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification option
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search option
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Image scroll for offers
            ImageScroller(),
            // Replace this with your image scroll widget for displaying offers

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // categories of products
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30, // Replace with the actual number of categories
                itemBuilder: (context, index) {
                  // Replace this with your category item widget
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.blue,
                    width: 100,
                    child: Center(
                      child: Text('Category $index'),
                    ),
                  );
                },
              ),
            ),

            // Text products in page
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            //
            // Grid of products
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 10, // Replace with the actual number of products
              itemBuilder: (context, index) {
                // Replace this with your product item widget
                return GestureDetector(
                  onTap: () {
                    // Handle tapping on a product
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image
                        Container(
                          height: 120,
                          width: double.infinity,
                          color: Colors.grey,
                          // Replace with your product image widget
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  'Price: \$100'), // Replace with the actual price
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {
                                // Handle liking a product
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_shopping_cart),
                                  onPressed: () {
                                    // Handle adding to cart
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.more_vert),
                                  onPressed: () {
                                    // Handle more options for a product
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Handle account option
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle home option
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Handle favorite option
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart option
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings option
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageScroller extends StatefulWidget {
  @override
  _ImageScrollerState createState() => _ImageScrollerState();
}

class _ImageScrollerState extends State<ImageScroller> {
  final List<String> images = [
    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif",
    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif",
    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif",
    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif",
    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 24,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        images[index],
                        width: screenWidth - 24, // Adjusted width with margin
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Selected Image: $_currentIndex',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

/*import 'package:flutter/material.dart';

// App starting main function
void main() {
  return runApp(MyApp());
}

//  home title main  intial class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "chat app",
      debugShowCheckedModeBanner: false,
      home: MyChatApp(),
    );
  }
}

//
// my chat app home page
class MyChatApp extends StatefulWidget {
  const MyChatApp({super.key});

  @override
  State<MyChatApp> createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  final List<String> items = List.generate(100, (index) => "Item $index");
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Mengobrol"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  // width: double.maxFinite,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text("Add Story"),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                Text("Name")
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),

            // chat and more
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "chat",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 28,
                  )
                ],
              ),
            ),

            // chat list
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      title: Text("name"),
                      subtitle: Text('default massage sent..'),
                      trailing: Column(
                        children: [
                          Text("00:00"),
                          Container(
                            color: Colors.green,
                            height: 20,
                            width: 20,
                          )
                        ],
                      ));
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            ElevatedButton(onPressed: () {}, child: Text("+ Add more")),
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          ],
        ),
      ),
    );
  }
}*/

// 4 scroll 2 list 2 grid

/*






import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Horizontal ListView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    color: Colors.blue,
                    width: 100,
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Vertical ListView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Horizontal GridView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Vertical GridView (3 Items)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: 300,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
