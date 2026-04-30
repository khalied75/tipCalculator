import 'package:flutter/material.dart';
import 'widgets/Pernsol_counter.dart';
import 'widgets/tipcluclotr.dart';
import 'widgets/BillAmount.dart';
import 'widgets/TotalperPerson.dart';
import 'widgets/Tip.dart';
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
  double _tipprecentge = 0.0;
  double _biileTota = 100.0;
  double totalPerPerson() {
    return ((_biileTota * _tipprecentge) + _biileTota) / personsCount;
  }
 double totalTip() {
    return (_biileTota * _tipprecentge );
  }
  void increasePersons() {
    setState(() {
      personsCount++;
    });
  }

  void decreasePersons() {
    if (personsCount > 1) {
      setState(() {
        personsCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var LocalTheme = Theme.of(context);
    double TotalPerPerson = totalPerPerson();
    double TotalTip = totalTip();
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
            TotalperPerson(LocalTheme: LocalTheme, style: style, TotalPerPerson: TotalPerPerson),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: LocalTheme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmount(
                    billAmount: _biileTota.toString(),
                    onChanged: (value) {
                      setState(() {
                        _biileTota = double.parse(value);
                      });
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
                        PersnolalCount(
                          personsCount: personsCount,
                          onIncrease: increasePersons,
                          onDecrease: decreasePersons,
                        ),
                      ],
                    ),
                  ),
                  Tip(TotalTip: TotalTip),
                  Text(
                    "${(_tipprecentge * 100).toStringAsFixed(1)}%",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  tipcaluctor(
                    tipprecentge: _tipprecentge,
                    onChanged: (value) {
                      setState(() {
                        _tipprecentge = value;
                      });
                    },
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


