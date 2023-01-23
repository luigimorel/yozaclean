import 'package:apps/screens/business/details.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../widgets/business_card.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 5, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Joy',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomTheme.defaultTheme.primaryColor),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                    icon: const Icon(Icons.person),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'What services would you like?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 64,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    imagePath: 'assets/logo.png',
                    categoryName: 'Warehouse  Cleaning',
                  ),
                  CategoryCard(
                    imagePath: 'assets/logo.png',
                    categoryName: 'After Party Cleaning',
                  ),
                  CategoryCard(
                    imagePath: 'assets/logo.png',
                    categoryName: 'After Party Cleaning',
                  ),
                  CategoryCard(
                    imagePath: 'assets/logo.png',
                    categoryName: 'After Party Cleaning',
                  ),
                  CategoryCard(
                    imagePath: 'assets/logo.png',
                    categoryName: 'Cleaning',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Recommended',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: const [
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/clean.png',
                        ratingText: '4',
                        businesName: 'Super Cleaners',
                        amount: '20,000',
                        jobType: 'After Event Cleaning ',
                      ),
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/upper.png',
                        ratingText: '4',
                        businesName: 'Extra dry cleaners',
                        amount: '50,000',
                        jobType: 'Construction site ',
                      ),
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/rodnae.png',
                        ratingText: '4',
                        businesName: 'Super Cleaners',
                        amount: '30,000',
                        jobType: 'Carpet Cleaning',
                      ),
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/clean.png',
                        ratingText: '4',
                        businesName: 'Super Cleaners',
                        amount: '40,000',
                        jobType: 'Sofa cleaning',
                      ),
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/rodnae.png',
                        ratingText: '4',
                        businesName: 'Super Cleaners',
                        amount: '10,000',
                        jobType: 'Carpet Cleaning',
                      ),
                      BusinessCard(
                        route: BusinessDetails(),
                        image: 'assets/upper.png',
                        ratingText: '4',
                        businesName: 'Super Cleaners',
                        amount: '51,000',
                        jobType: 'Carpet Cleaning',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
