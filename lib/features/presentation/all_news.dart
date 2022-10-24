import 'package:flutter/material.dart';

final int number = 15;

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.only(top: 27),
          child: Expanded(
            child: ListView.builder(
              itemCount: number,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1)
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: Image.network(
                            'https://i.ebayimg.com/thumbs/images/g/FTAAAOSw6bti-oYA/s-l225.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 220,
                            child: Text('«Бывший начальник службы безопасности Uber признан виновным в сокрытии массовой утечки данных в 2016 году»', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),)
                          ),
                          SizedBox(height: 10,),
                          Text('Anna Karelina',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey))
                        ],
                      )

                    ],
                  ),
                );
              },
            ),
          )
      ),
    );
  }
}