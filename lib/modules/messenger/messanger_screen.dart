import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  // const MessangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        //AppBar Shadow
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1401955846880440326/DlAg8cPq_400x400.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  radius: 30.0,
                  child: Icon(
                    Icons.camera_alt,
                    size: 18.0,
                    color: Colors.white,
                  ))),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  radius: 30.0,
                  child: Icon(
                    Icons.edit,
                    size: 18.0,
                    color: Colors.white,
                  ))),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SearchBar
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[350],
                ),
                padding: EdgeInsets.all(10.0,),
                child: Row(
                  children: [
                      Icon(Icons.search),
                      SizedBox(width: 10,),
                      Text('Search'),
                    ],
                ),
              ),
              SizedBox(height: 10.0,),

              //StoriesBar
              Container(
                height: 110,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (context, index) => SizedBox(width: 10.0,),
                    itemCount: 7),
              ),
              SizedBox(height: 20.0,),
              //ChatList
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index)=> buildChatItem(),
                  separatorBuilder: (context,index)=> SizedBox(height: 10.0,),
                  itemCount: 10)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStoryItem() => Container(
  width: 70.0,
  child:Column(

    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1401955846880440326/DlAg8cPq_400x400.jpg'
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),

        ],
      ),
      SizedBox(height: 6.0,),
      Text(
        'Mohamed Mohsen Mohamed Mohsen Mohamed Mohsen',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )
    ],
  ) ,
);
Widget buildChatItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        //Profilepic
        CircleAvatar(
          radius: 35.0,
          backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1401955846880440326/DlAg8cPq_400x400.jpg'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 3,
              end: 3),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.red,
          ),
        )
      ],
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Name
          Text(
            "Mohamed Mohsen",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20.0,

            ),
          ),
          SizedBox(height: 10.0,),


          Row(
            children: [
              Expanded(
                //Message
                child: Text(
                  "Hello guys My name is mohamed mohsen nabih and i'm software engineer",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,

                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                ),
              ),
              //Date
              Text(
                "02:00 Am",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey
                ),

              ),
            ],
          )
        ],
      ),
    ),
  ],
);