import 'post.dart';

class UserPosts {
  static List<Post> posts = [
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2000, 10, 19,), 'Hossein', 'SBUuuuuuuu'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 4), 'Hossein', 'SBU'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 15), 'Hossein', 'SBU'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 26), 'Hossein', 'SBU'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 15), 'Hossein', 'SBU'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 16, 48), 'Hossein', 'SBU'),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime.now(), 'Hossein', 'SBU')
  ];

  // method that add post and sort
  static addPost(Post post) {
    //ToDo => shamsi date & each post of per associations
    posts.add(post);
    posts.sort((b, a) => a.time.compareTo(b.time));
  }
}
