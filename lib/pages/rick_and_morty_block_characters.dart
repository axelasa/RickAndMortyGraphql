import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_block.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_state.dart';

class RickAndMortyBlocCharacters extends StatefulWidget {
  const RickAndMortyBlocCharacters({Key? key}) : super(key: key);

  @override
  State<RickAndMortyBlocCharacters> createState() => _RickAndMortyBlocCharactersState();
}

class _RickAndMortyBlocCharactersState extends State<RickAndMortyBlocCharacters> {

  List data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child:Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0)
              ),

              child: BlocBuilder<RickAndMortyBlock,RickAndMortyState>(
                builder: ( context,state ) {
                  if(state is RickAndMortyLoadDataSuccess) {
                    data = state.data['characters']['results'];
                    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),

                      itemCount: data.length,
                      itemBuilder: (context,index){
                      var item = data[index];
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
                                print('This is the argument i have Clicked:${state.data[index].animeId}');
                              },

                              child: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(item['name']),
                                subtitle: Text('Species: ${item['species'].toString()}'),
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
                                      print('This is the argument i have Clicked footer:${state.data[index].animeId}');
                                    },
                                    child: ImageNetwork(
                                      image: item['image'].toString(),
                                      fitWeb: BoxFitWeb.cover, height: 300, width: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                  }
                   return const SizedBox.shrink();
                }
              )
          ),
        )
    );
  }
}

