// import 'dart:html';


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/layout/news_app/cubit/NewsCubit.dart';
import 'package:testing_app/layout/news_app/cubit/NewsStates.dart';
import 'package:testing_app/model/news/news_model.dart';
import 'package:testing_app/modules/web_view/web_view_screen.dart';
import 'package:testing_app/shared/cubit/cubit.dart';


Widget defaultButton(
        {required void Function() function,
        required String text,
        double width = double.infinity,
        Color background = Colors.blue,
        double radius = 10}) =>
    Container(
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: 50,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextFormField(
        {required TextEditingController controller,
        required TextInputType type,
        required FormFieldValidator validate,
        required IconData prefix,
        String? hintText,
        String? labelText,
        IconData? suffixIcon,
        Function? onTap,
        Function? onSubmit,
        Function? onChange,
        bool isPassword = false,
        bool isClicable = true}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      enabled: isClicable,
      validator: validate,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
    key: Key("$model['id']"),
    onDismissed: (direction){
      AppCubit.get(context).delete(id: model['id']);
    },
    child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).update(status: "done", id: model['id']);
              },
              icon: Icon(Icons.check_box),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).update(status: "archive", id: model['id']);
              },
              icon: Icon(Icons.archive),
              color: Colors.black45,
            ),
          ],
        ),
      ),
);


Widget taskBuilder(List<Map> tasks)=> ConditionalBuilder(condition: tasks.length>0,
    builder:(context)=> ListView.separated(
        itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
        separatorBuilder: (context, index)=> myDivider(),
        itemCount: tasks.length),
    fallback: (context)=> Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.menu,
          size: 100.0,
          color: Colors.grey,),
        Text("No Tasks Yet, Please Add Some Tasks",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
        )
      ],
    ))
);

Widget buildArticleItem(article , context)=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article["url"]));
    // WebViewScreen(article["url"]);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    '${article["urlToImage"]}',),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article["title"]}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article["publishedAt"]}',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list, context) => ConditionalBuilder(
    condition: State is! NewsBusinessLoadingState,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          buildArticleItem(list[index], context),
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => myDivider(),),
    fallback: (context) => Center(child: CircularProgressIndicator(),)
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);