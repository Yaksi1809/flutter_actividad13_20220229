import 'package:flutter/material.dart';
import 'package:search_list_tuto/model/movie_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static List<MovieModel> main_movies_list = [
    MovieModel("Suga: Road to D-DAY", 2024, 9.9, 
    "https://larepublica.cronosmedia.glr.pe/original/2024/03/05/65e7eebe11bb376bf307a6c2.jpg"),
    MovieModel("Love Yourself in Seoul", 2019, 10, 
    "https://i.pinimg.com/736x/21/5a/a9/215aa95fd84448fc5371c361343b3c2d.jpg"),
    MovieModel("BTS: Yet to Come", 2023, 9.8, 
    "https://pragativadi.com/wp-content/uploads/2022/12/1671579008-untitled-1-1000x580.jpg"),
    MovieModel("Burn the Stage: The Movie", 2018, 9.7, 
    "https://i.pinimg.com/1200x/2f/3f/e3/2f3fe3fec1feb4f4868888415eb11c86.jpg"),
    MovieModel("BTS: PERMISSION TO DANCE ON STAGE - LA", 2023, 9.5, 
    "https://pbs.twimg.com/media/FcKXpmmXgAMXATH.jpg"),
    MovieModel("Bring the Soul: The Movie", 2019, 9.6, 
    "https://cdn.unotv.com/images/2023/09/bring-the-soul-2-103609.jpg"),
  ];

  // ignore: non_constant_identifier_names
  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) //Esta función es para fltrar nuestra lista
  {
    setState(() {
      display_list = main_movies_list
        .where((element) => 
          element.movie_title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 34, 117),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 153, 70, 168),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Movie", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22.0, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20.00,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor:Color.fromARGB(255, 197, 104, 214),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Suga: Road to D-DAY",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 233, 143, 249),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.length == 0 ?Center(
                child: Text(
                  "Now result found",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                  ))
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!, 
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${display_list[index].movie_release_year!}', 
                            style: TextStyle(
                              color: Colors.white60
                            ),
                          ),
                          trailing: Text(
                            "${display_list[index].rating}",
                            style: TextStyle(color: const Color.fromARGB(255, 246, 136, 173)),
                            ),
                          leading: Image.network(display_list[index].movie_poster_url!),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


