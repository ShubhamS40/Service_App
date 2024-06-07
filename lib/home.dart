import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Service> services = [
    Service('Women\'s Salon', Icons.face),
    Service('Men\'s Salon & Massage', Icons.man),
    Service('AC & Appliance Repair', Icons.build),
    Service('Cleaning & Pest Control', Icons.cleaning_services),
    Service('Electrician, Plumber & Carpenter', Icons.electrical_services),
    Service('Native Water Purifier', Icons.water),
    Service('Painting & Waterproofing', Icons.format_paint),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart
        ))
      ],
      title: Text("Home Page",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      bottom: PreferredSize(
         preferredSize: Size.fromHeight(2.0),
        child: Container(
            color: Color.fromARGB(255, 224, 224, 224),
           height: 4.0, 
          
        ),
        

      ),
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Karol Bagh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Delhi - 110040 - India',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                itemCount: services.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple[50],
                        child: Icon(
                          services[index].icon,
                          size: 30,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        services[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
              // GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) {
              //     return Column(
              //       children: [
              //        Container(
              //         child: IconButton(onPressed: (){},icon: Icon(Icons.shopping_bag),),
              //         decoration: BoxDecoration(
              //           color: Colors.yellow,
              //           border:Border.all( 
              //             color: Colors.black,
              //             width: 4
              //           ),
              //           borderRadius: BorderRadius.circular(8)
              //         ),
              //        ),
                     
              //       ],
              //     );
              //   },
              //   ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/300x100.png?text=Ad+Banner'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Save up to ₹3,000 on electricity bills',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'UC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Beauty',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Homes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Native',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class Service {
  final String name;
  final IconData icon;

  Service(this.name, this.icon);
}
