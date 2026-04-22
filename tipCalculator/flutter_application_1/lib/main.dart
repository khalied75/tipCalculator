import 'package:flutter/material.dart';
import 'widgets/Pernsol_counter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int personsCount = 1;
  void increasePersons() {
    setState(() {
      personsCount++;
    });
  }

  void decreasePersons() {
    if (personsCount > 0) {
      setState(() {
        personsCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var LocalTheme = Theme.of(context);
    final style = LocalTheme.textTheme.titleLarge!.copyWith(
      color: LocalTheme.colorScheme.onPrimary,
      fontWeight: FontWeight.normal,
    );
    // print(context.owner);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UTip',
          style: style.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: LocalTheme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Total per Person", style: style),
                  Text("\$20.00", style: style.copyWith(fontSize: 40)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: LocalTheme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Bill Amount",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Split",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PersnolalCount(personsCount: personsCount,onIncrease: increasePersons, onDecrease: decreasePersons),
                      ],
                      
                    ),
                    
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text("\$20.00",style: Theme.of(context).textTheme.titleMedium,)
                      ],
                    ),
                    Text("25%",style: Theme.of(context).textTheme.titleLarge,),
                    // Slider(value: 4.8, onChanged:)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


