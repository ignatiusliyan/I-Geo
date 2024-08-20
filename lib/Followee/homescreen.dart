import 'package:flutter/material.dart';

class FolloweeDash extends StatefulWidget {
  const FolloweeDash({super.key});

  @override
  State<FolloweeDash> createState() => _FolloweeDashState();
}

class _FolloweeDashState extends State<FolloweeDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
              child: ListTile(
                title: Text('ignatiusliyan@gmail.com'),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.adjust_sharp,
                      color: Colors.green,
                      size:17,
                    ),
                    Text('Sharing'
                      ,style:TextStyle(
                        color: Colors.green
                      ) ,)
                  ],
                ),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.visibility_sharp,color: Colors.amber,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
