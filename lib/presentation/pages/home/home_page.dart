
import 'package:cubit_bloc/core/utils/constants/sizes.dart';
import 'package:cubit_bloc/core/utils/debug/log_read.dart';
import 'package:cubit_bloc/domain/entities/search_data.dart';
import 'package:cubit_bloc/presentation/cubits/search/search_cubit.dart';
import 'package:cubit_bloc/presentation/cubits/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 250, // Adjust width as needed
              child: TextField(
                controller: searchText,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchText.clear();// Optional: Clear search results
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final query = searchText.text.trim();
              if (query.isNotEmpty) {
                context.read<SearchCubit>().search(text: query);
              }
            },
          ),
        ],
      ),
      drawer:  HomeDrawer(),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            return SearchList(state: state.searchData);
          } else if (state is SearchError) {
            logView(state.message);
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }
          return const Center(child: Text('Start searching...'));
        },
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.state});

  final SearchData state;

  @override
  Widget build(BuildContext context) {
    if (state.category == null || state.category!.isEmpty) {
      return const Center(child: Text('No results found', style: TextStyle(fontSize: 16)));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.sm_8),
            child: Text('Category',style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.category!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(state.category![index].name ?? ''),
                  ),
                );
              },
            ),
          ),
          Text('Subcategory',style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.subcategory!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(state.subcategory![index].name ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
