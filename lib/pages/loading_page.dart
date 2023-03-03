import 'package:flutter/material.dart';
import 'package:rick_and_morty_graphql/api/network_call.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void network()async{
    var data = await apiCall();
    Navigator.pushReplacementNamed(context, '/rick_and_morty_characters',arguments: data);

  }
  @override
  void initState() {
    super.initState();
    setState(() {
      network();
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
