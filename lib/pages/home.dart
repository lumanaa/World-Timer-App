import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _nameState();
}

class _nameState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime']
        ? 'https://i.pinimg.com/564x/b5/49/78/b54978334dd062cebc1dfa3194718257.jpg'
        : 'https://i.pinimg.com/736x/56/24/7e/56247e319e67da5687e22bbef5a4785a.jpg';

    // Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(bgImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'Indie',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              data['time'],
              style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            SizedBox(height: 60,),
            ElevatedButton.icon(
              
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': result['location'],
                      'time': result['time'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime']
                    };
                   
                  });
                },
                icon: Icon(Icons.location_on_sharp),
                label: Text('Change Location'),
                style:  ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFF83BCFF))
                    ),),
                
                
          ],
        ),
      ),
    );
  }
}
