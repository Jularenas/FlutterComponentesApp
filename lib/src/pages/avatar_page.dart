import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/en/b/b0/Avatar_The_Last_Airbender_The_Promise_Part_1_cover.jpg",
          ),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.insider.com/5ebdbc8c3ad8612a1c7aa143?width=900&format=jpeg&auto=webp"),
            ),
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          Container(
            child: CircleAvatar(
              child: Text("data"),
              backgroundColor: Colors.amberAccent,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.all_out),
      ),
    );
  }
}
