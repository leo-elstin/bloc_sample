import 'package:bloc_sample/core/bloc/home/home_bloc.dart';
import 'package:bloc_sample/core/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(
      LoginClicked('leoelstin', 'leoelstin'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        provider: LoginProvider(),
      ),
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('${state.status}'),
                      );
                    });
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is LoginFailed) {
                return Center(
                  child: Text(
                    state.error,
                  ),
                );
              }

              if (state is LoginSuccess) {
                return Center(
                  child: Text(
                    state.status,
                  ),
                );
              }

              if (state is Loaded)
                return Center(
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('LoginIn'),
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            LoginClicked('leoelstin', 'leoelstin'),
                          );
                        },
                      ),
                    ],
                  ),
                );

              return SizedBox();
            }),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
