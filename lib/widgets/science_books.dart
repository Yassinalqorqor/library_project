import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/logic/home_cubit.dart';

import '../screens/book_details_screen.dart';

class ScienceBooks extends StatelessWidget {
  const ScienceBooks({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return (state is HomeLoading)?
        const Center(child: CircularProgressIndicator()):
         ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  BookDetailsScreen(bookdetails: cubit.science[index], ),),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  // color:Colors.grey.shade200,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        cubit.science[index].image!,
                        width: 100,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30,),

                            Text(
                                cubit.science[index].title!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),

                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              cubit.science[index].author!,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Book Details', style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),),
                                Center(
                                    child: Icon(

                                      Icons.arrow_forward_ios,
                                      color: Colors.redAccent,
                                    )),
                              ],
                            ),
                            const SizedBox(

                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },

            itemCount: cubit.science.length);
      });
  }
}