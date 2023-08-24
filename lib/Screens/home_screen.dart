import 'package:flutter/material.dart';
import 'package:searchable_listview_flutter/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Users> _users = [
    Users(
      name: "Dasha Taran",
      image:
          "https://e5fodz76tgp.exactdn.com/wp-content/uploads/2023/05/Dasha-Taran-Instagram-Model-Biography-Age-and-Boyfriend.jpg",
      isboolean: false,
    ),
    Users(
      name: "Rose Blackpink",
      image:
          "https://www.celebface.in/wp-content/uploads/2020/08/Rose-Blackpink-Biography.jpg",
      isboolean: true,
    ),
  ];

  List<Users> foundedUsers = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      foundedUsers = _users
          .where(
              (user) => user.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            onChanged: (value) {
              onSearch(value);
            },
            decoration: const InputDecoration(
              hintText: "Search",
              filled: true,
              fillColor: Colors.amber,
              prefixIcon: Icon(
                Icons.search,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
      ),
      //
      // ignore: prefer_is_empty
      body: foundedUsers.length > 0
          ? ListView.builder(
              itemCount: foundedUsers.length,
              itemBuilder: (context, index) {
                return userComponent(user: foundedUsers[index]);
              },
            )
          : const Center(
              child: Text("Not founded!"),
            ),
    );
  }

  //
  userComponent({required Users user}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.image),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  //
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
