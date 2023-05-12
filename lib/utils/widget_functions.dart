import 'package:flutter/material.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String? serial,
}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
            content: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      height: 30,
                        width: 30,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pinkAccent.shade100),
                        child: Icon(
                          Icons.person,size: 30,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 5, 0, 0),
                    child: Text('Saber Ali',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
                    child: Text('Dhaka Bangladesh',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.network(
                        title,
                        width: 400,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,260,0,0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('View Post',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120,5,0,0),
                    child: Container(
                      height: 34,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.shade100,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Icon(Icons.person,color: Colors.deepOrangeAccent,size: 15,grade: 10,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,2,0,0),
                                child: Icon(Icons.add,color: Colors.deepOrangeAccent,size: 10,),
                              ),
                            ]),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,2,0,0),
                              child: Text('Follow',style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 10,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ));
}
