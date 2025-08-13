import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalema_coffee/utils/coffee_tile.dart';
import 'package:kalema_coffee/utils/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee Type
  final List coffeeType = [
    ['Cappucino', true],
    ['Latté', false],
    ['Café noir', false],
    ['Thé', false],
  ];

  //user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      //this for loop make all items at false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Trouver un meilleur café pour vous',
              style: GoogleFonts.bebasNeue(fontSize: 48),
            ),
          ),
          SizedBox(height: 25),

          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Trouver un café',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),

          // Horizontal listview of list types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          // Horizontal listview of list coffee
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.png',
                  coffeeName: 'Latté',
                  coffeePrice: '3.00',
                  coffeeDescription: 'Café doux, lait chaud, mousse crémeuse',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cappucino.png',
                  coffeeName: 'Cappucino',
                  coffeePrice: '3.30',
                  coffeeDescription:
                      'Expresso corsé, lait mousseux, arôme intense.',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/milk.png',
                  coffeeName: 'Café au lait',
                  coffeePrice: '4.00',
                  coffeeDescription: 'Café fort, lait chaud, douceur parfaite',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/herbaltea.png',
                  coffeeName: 'thé aux herbes',
                  coffeePrice: '1.70',
                  coffeeDescription: 'Infusion apaisante, arômes naturels',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/thecitron.png',
                  coffeeName: 'thé au citron',
                  coffeePrice: '2.30',
                  coffeeDescription:
                      'Thé noir, zeste de citron, rafraîchissant',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/beverage.png',
                  coffeeName: 'thé aux fruits',
                  coffeePrice: '3.20',
                  coffeeDescription: 'Infusion fruitée, explosion de saveurs',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
