import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';

class MovieDetail extends StatelessWidget {
  // final Pelicula pelicula;

  // MovieDetail(this.pelicula);

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula =
        ModalRoute.of(context)!.settings.arguments as Pelicula;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              _posterTitle(pelicula, context),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
              _description(pelicula),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _createAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black87,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${pelicula.title}',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle(Pelicula pelicula, context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${pelicula.title}',
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Text('${pelicula.originalTitle}',
                  style: Theme.of(context).textTheme.subtitle2),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border, color: Colors.yellow),
                  Text(' ${pelicula.voteAverage} ',
                      style: Theme.of(context).textTheme.subtitle1)
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(' ${pelicula.overview} ', textAlign: TextAlign.justify),
    );
  }
}
