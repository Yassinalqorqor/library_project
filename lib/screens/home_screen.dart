import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/logic/home_cubit.dart';

import '../models/library_book_model.dart';
import '../widgets/businness_books.dart';
import '../widgets/free_books.dart';
import '../widgets/programming_books.dart';
import '../widgets/science_books.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final List<BookModel> bookdetails;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getprogramming()
        ..getscience()
        ..getBusiness()
        ..getfreebooks(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Menu',
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            'Programming',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Science',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Business',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Free books',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Card(
                      color: Colors.blueAccent.shade100,
                      margin: const EdgeInsets.all(8.0),
                      child: const ProgrammingBooks(),
                    ),
                    Card(
                      color: Colors.blueAccent.shade100,
                      margin: const EdgeInsets.all(8),
                      child: const ScienceBooks(),
                    ),
                    Card(
                      color: Colors.blueAccent.shade100,
                      margin: const EdgeInsets.all(8),
                      child: const BusinnessBooks(),
                    ),
                    Card(
                      color: Colors.blueAccent.shade100,
                      margin: const EdgeInsets.all(8),
                      child: const FreeBooks(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
