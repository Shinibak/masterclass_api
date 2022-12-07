import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../datasource/get_animes_datasource.dart';
import '../models/anime_model.dart';
import '../repository/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc(
      repository: HomeRepository(getAnimeDatasource: GetAnimesDatasource()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masterclass 5'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is InitialHomeState) {
                  return Container(
                    child: const Text("InitialState"),
                  );
                }

                if (state is LoadingHomeState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is SuccessHomeState) {
                  return _buildSucessState(state.listModel);
                }

                if (state is ErrorHomeState) {
                  return Container(
                    child: Text("ErrorState ${state.message}"),
                  );
                }

                return const SizedBox();
              })),
    );
  }
}

Widget _buildSucessState(List<AnimeModel> animes) {
  return ListView.builder(
    itemCount: animes.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      animes[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    '${animes[index].date.day}/${animes[index].date.month}/${animes[index].date.year}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                animes[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => launchUrlString(animes[index].link),
                  child: const Text(
                    'Acessar matéria',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/* ListView.builder(
          itemCount: mock.length,
          itemBuilder: (context, index) {
            final item = mock.elementAt(index);

            final title = item['title'] as String;            
            final description = item['description'] as String;
            final date = item['date'] as DateTime;
            final link = item['link'] as String;

            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          '${date.day}/${date.month}/${date.year}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () => launchUrlString(link),
                        child: const Text(
                          'Acessar matéria',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),*/