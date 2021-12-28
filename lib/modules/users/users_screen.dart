import 'package:flutter/material.dart';
import 'package:testing_app/model/user/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, phone: '01067273499', name: 'Mohamed Mohsen'),
    UserModel(id: 2, phone: '01068484521', name: 'Ahmed Abdelbaset'),
    UserModel(id: 3, phone: '01064841511', name: 'mahmoud ali'),
    UserModel(id: 4, phone: '01124412748', name: 'sara adel'),
    UserModel(id: 5, phone: '01247515715', name: 'Mohamed nasser'),
    UserModel(id: 6, phone: '01067273499', name: 'Mohamed Mohsen'),
    UserModel(id: 7, phone: '01068484521', name: 'Ahmed Abdelbaset'),
    UserModel(id: 8, phone: '01064841511', name: 'mahmoud ali'),
    UserModel(id: 9, phone: '01124412748', name: 'sara adel'),
    UserModel(id: 10, phone: '01247515715', name: 'Mohamed nasser'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=> buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Container(
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount: users.length)
    );
  }
}


Widget buildUserItem(UserModel user) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 30,
        child: Text(
          '${user.id}',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      SizedBox(width: 20,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5,),
          Text(
            '${user.phone}',
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey
            ),
          )
        ],
      )
    ],
  ),
);