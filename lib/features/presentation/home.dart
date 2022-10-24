import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              context.go('/top');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black38,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Text('Топ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
            ),

          ),
          const SizedBox(height: 50,),
          InkWell(
            onTap: () {
              context.go('/all');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black38,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Text('Все', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
            ),

          ),
          const SizedBox(height: 50,),
          InkWell(
            onTap: () {
              context.go('/top');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black38,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Text('Топ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
            ),

          ),
        ],
      ),
      )
    );
  }
}