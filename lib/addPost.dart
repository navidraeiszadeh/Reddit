import 'package:flutter/material.dart';
import 'Post.dart';

class AddPost extends StatefulWidget {
  const AddPost({required Key key, required this.addNewPost}) : super(key: key);
  final Function addNewPost;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late String title;

  late final TextEditingController titleC;
  late final TextEditingController body;
  late final DateTime time;

  @override
  void initState() {
    titleC = TextEditingController();
    body = TextEditingController();
    time = DateTime.now();
    super.initState();
  }

  void dispode() {
    titleC.dispose();

    /// make state to unusable state
    body.dispose();
    time.toString();
    super.dispose();
  }

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Center(),
    Center(
      child: Icon(
        Icons.add_a_photo,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.video_collection,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.link,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.keyboard_voice,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.poll,
        size: 150,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.next_plan,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              String title = titleC.text;
              String desc = body.text;
              DateTime datetime = time;
              Post post = Post(title, desc, 0, datetime);
              widget.addNewPost(post);
              titleC.clear();
              body.clear();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text("Add Post"),
        backgroundColor: Colors.black45,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black45,
        selectedFontSize: 20,
        selectedIconTheme:
            const IconThemeData(color: Colors.deepOrangeAccent, size: 28),
        selectedItemColor: Colors.deepOrangeAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.add_link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.keyboard_voice),
            label: 'Voice',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.poll),
            label: 'Poll',
          ),
        ],
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
      ),
      body: (_selectedIndex == 0)
          ? Container(
              color: Colors.black26,
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "An interesting title"),
                      controller: titleC,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 150,
                    child: TextField(
                      decoration: const InputDecoration(hintText: "Text Body"),
                      controller: body,
                      keyboardType: TextInputType.multiline,
                      minLines: 10,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            )
          : IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
