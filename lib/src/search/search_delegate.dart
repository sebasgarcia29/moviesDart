import 'package:flutter/material.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

//Model
import 'package:movies/src/models/pelicula_model.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = PeliculasProvider();
  String seleccion = '';

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Ironman',
    'Capitan America',
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions de nuestro appbar
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Muestra los resultados que vamos a mostrar
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.red,
        child: Text('$seleccion'),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapchot) {
        if (snapchot.hasData) {
          final peliculas = snapchot.data;

          return ListView(
            children: peliculas!.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title.toString()),
                subtitle: Text(pelicula.originalTitle.toString()),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  //   @override
  // Widget buildSuggestions(BuildContext context) {
  //   final listaSugerida = (query.isEmpty)
  //       ? peliculasRecientes
  //       : peliculas.where(
  //         (p) => p.toLowerCase().startsWith(query.toLowerCase())
  //         ).toList();

  //   // Son las sugerencias que aparecen cuando la persona escribe
  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: () {
  //           seleccion = listaSugerida[i];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }
}
