import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui';

void main() {
  runApp(BellyTalk());
}

class BellyTalk extends StatefulWidget {
  @override
  _BellyTalkState createState() => _BellyTalkState();
}

class _BellyTalkState extends State<BellyTalk> {
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _imageTextController = TextEditingController();
  List<Post> _posts = [];
  List<User> _users = [
    User(name: 'Jane Doe', location: 'Bulacan'),
    User(name: 'Maria Cruz', location: 'Manila'),
  ];
  String _selectedCategory = 'All';

  void _addPost() {
    if (_postController.text.isNotEmpty || _imageTextController.text.isNotEmpty) {
      setState(() {
        _posts.add(Post(
          user: _users[0],
          text: _postController.text,
          category: _selectedCategory,
          imageText: _imageTextController.text,
          image: null,
          isFavorite: false,
          likes: 0,
          location: _users[0].location,
          comments: [],
        ));
        _postController.clear();
        _imageTextController.clear();
      });
    }
  }

  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _posts.add(Post(
          user: _users[0],
          text: '',
          category: _selectedCategory,
          image: File(image.path),
          imageText: '',
          isFavorite: false,
          likes: 0,
          location: _users[0].location,
          comments: [],
        ));
      });
    }
  }

  void _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _posts.add(Post(
          user: _users[0],
          text: '',
          category: _selectedCategory,
          image: File(image.path),
          imageText: '',
          isFavorite: false,
          likes: 0,
          location: _users[0].location,
          comments: [],
        ));
      });
    }
  }

  void _toggleFavorite(Post post) {
    setState(() {
      post.isFavorite = !post.isFavorite;
      if (post.isFavorite) {
        post.likes += 1;
      } else {
        post.likes -= 1;
      }
    });
  }

  void _addComment(Post post, String commentText) {
    if (commentText.isNotEmpty) {
      setState(() {
        post.comments.add(Comment(user: _users[0], text: commentText));
      });
    }
  }

  void _deletePost(Post post) {
    setState(() {
      _posts.remove(post);
    });
  }

  void _editPost(Post post) {
    final TextEditingController editController = TextEditingController(text: post.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: 'Edit your post...'),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                final updatedText = editController.text; // Store updated text
                setState(() {
                  post.text = updatedText; // Update post.text with the updated text
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editComment(Comment comment) {
    final TextEditingController editCommentController = TextEditingController(text: comment.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Comment'),
          content: TextField(
            controller: editCommentController,
            decoration: InputDecoration(hintText: 'Edit your comment...'),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  comment.text = editCommentController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              ),
            ),
          ),
         Column(
  children: [
    Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Color(0xFFC98F8F).withOpacity(0.2),
        child: Column(
          children: [
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
                filled: true,
              ),
              maxLines: 3,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.black,
                  ),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onPressed: _takePicture,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                  onPressed: _addPost,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
              Container(
  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Change to start for left alignment
      children: [
        _buildCategoryButton('Pregnancy Updates'),
        SizedBox(width: 16.0), // Add spacing between buttons if needed
        _buildCategoryButton('Baby Care Tips'),
        SizedBox(width: 16.0), // Add spacing between buttons if needed
        _buildCategoryButton('Health & Wellness'),
      ],
    ),
  ),
),

              Expanded(
                child: ListView(
                  children: _posts
                      .where((post) =>
                          _selectedCategory == 'All' ||
                          post.category == _selectedCategory)
                      .map((post) => PostWidget(
                            post: post,
                            onFavoriteToggle: () => _toggleFavorite(post),
                            onAddComment: (commentText) => _addComment(post, commentText),
                            onDelete: () => _deletePost(post),
                            onEdit: () => _editPost(post),
                            onEditComment: (comment) => _editComment(comment),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          Positioned(
            top: 50.0,
            left: 16.0, // Adjusted left padding for the back button
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black, // Change color as needed
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 60.0,
            left: 150,
            child: Transform.translate(
              offset: Offset(-60, 0), // Adjust this value based on your text width
              child: Text(
                'BellyTalk Community',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Text(category),
    );
  }
}

class Post {
  User user;
  String text;
  String category;
  File? image;
  String imageText;
  bool isFavorite;
  int likes;
  String location;
  List<Comment> comments;

  Post({
    required this.user,
    required this.text,
    required this.category,
    this.image,
    required this.imageText,
    required this.isFavorite,
    required this.likes,
    required this.location,
    required this.comments,
  });
}

class User {
  String name;
  String location;

  User({required this.name, required this.location});
}

class Comment {
  User user;
  String text;

  Comment({required this.user, required this.text});
}

class PostWidget extends StatelessWidget {
  final Post post;
  final VoidCallback onFavoriteToggle;
  final Function(String) onAddComment;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final Function(Comment) onEditComment;

  PostWidget({
    required this.post,
    required this.onFavoriteToggle,
    required this.onAddComment,
    required this.onDelete,
    required this.onEdit,
    required this.onEditComment,
  });

@override
Widget build(BuildContext context) {
  return Card(
    child: Column(
      children: [
        // Add a Row to include the profile picture
        Row(
          children: [
            // Profile Picture with initial letter
            CircleAvatar(
              radius: 20.0, // Adjust the size as needed
              child: Text(
                post.user.name.isNotEmpty ? post.user.name[0] : 'U', // Use first letter of the user's name
                style: TextStyle(fontSize: 20.0, color: Colors.white), // Adjust text size and color
              ),
              backgroundColor: Colors.pink, // Set background color for the CircleAvatar
            ),
            SizedBox(width: 8.0), // Space between profile picture and text
            // ListTile for user name and location
            Expanded(
              child: ListTile(
                title: Text(post.user.name),
                subtitle: Text(post.user.location),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit();
                        } else if (value == 'delete') {
                          onDelete();
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(post.text),
        ),
        if (post.image != null) Image.file(post.image!),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Heart icon and total likes
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      post.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: post.isFavorite ? Colors.red : null,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                  SizedBox(width: 4.0), // Adds a small space between the icon and the text
                  Text(
                    post.likes.toString(), // Displays the number of likes
                    style: TextStyle(fontSize: 16.0), // Optional: adjust the text size
                  ),
                  SizedBox(width: 4.0), // Adds a small space between the likes number and the text
                  Text(
                    'Likes', // The text "Likes"
                    style: TextStyle(fontSize: 16.0), // Optional: adjust the text size
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  String commentText = '';
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Add Comment'),
                        content: TextField(
                          onChanged: (value) {
                            commentText = value;
                          },
                          decoration: InputDecoration(hintText: 'Write a comment...'),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              onAddComment(commentText);
                              Navigator.of(context).pop();
                            },
                            child: Text('Add'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add Comment'),
              ),
            ],
          ),
        ),
        if (post.comments.isNotEmpty)
          Column(
            children: post.comments.map((comment) {
              return ListTile(
                title: Text(comment.user.name),
                subtitle: Text(comment.text),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => onEditComment(comment),
                ),
              );
            }).toList(),
          ),
      ],
    ),
  );
}
}