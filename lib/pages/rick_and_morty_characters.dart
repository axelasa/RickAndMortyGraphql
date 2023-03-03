import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class RickAndMortyCharacters extends StatefulWidget {
  const RickAndMortyCharacters({Key? key}) : super(key: key);

  @override
  State<RickAndMortyCharacters> createState() => _RickAndMortyCharactersState();
}

class _RickAndMortyCharactersState extends State<RickAndMortyCharacters> {

  dynamic data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as dynamic;
    print('TOP AIRING DATA =>${data['results']}');
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child:Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0)
              ),
              child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
                  itemCount: data['results'].length,
                  itemBuilder: (context,index){
                    return GridTile(
                      footer: Material(
                        color: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: GestureDetector(
                          onTap:(){
                            //Navigator.pushNamed(context,'/anime_details',arguments: data[index].animeId.toString());
                            print('This is the argument i have Clicked:${data[index].animeId}');
                          },
                          child: GridTileBar(
                            backgroundColor: Colors.black45,
                            title: Text(data['results'][index]['name'].toString()),
                            subtitle: Text('Species: ${data['results'][index]['species'].toString()}'),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child:InkWell(
                                onTap: (){
                                  //Navigator.pushNamed(context,'/anime_details',arguments: data[index].animeId.toString());
                                  print('This is the argument i have Clicked footer:${data[index].animeId}');
                                },
                                child: ImageNetwork(
                                  image: data['results'][index]['image'].toString(),
                                  fitWeb: BoxFitWeb.cover, height: 300, width: 300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
          ),
        )
    );
  }
}
