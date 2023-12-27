import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:logistics_test_app/business_logic/models/SearchResponseModel.dart';
import 'package:provider/provider.dart';
import '../business_logic/view_models/search_response_vm.dart';
import '../utils/constants.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          SearchResponseViewModel(), // Assuming SearchResponseViewModel is your ViewModel
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Consumer<SearchResponseViewModel>(
            builder: (context, searchResponseViewModel, child) {
              return Column(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (query) async {
                        if (query.length > 2) {
                          await searchResponseViewModel.search(query);
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: textStyle(20, textColor: Colors.blue),
                          hintStyle: textStyle(15),
                          hintText: "Enter location to search"),
                    ),
                  ),
                  searchResponseViewModel.isLoading
                      ? const CircularProgressIndicator()
                      : searchResponseViewModel.values!.isEmpty
                          ? Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  child: Text(
                                    "No data ",
                                    style: textStyle(20),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount:
                                    searchResponseViewModel.values?.length,
                                itemBuilder: (context, index) {
                                  Value? value =
                                      searchResponseViewModel.values?[index];
                                  return ListTile(
                                    title: Text(
                                      value?.transporterName ?? "",
                                      style: textStyle(15),
                                    ),
                                    subtitle: Text(
                                      value?.transporterId ?? "",
                                      style: textStyle(12),
                                    ),
                                  );
                                },
                              ),
                            ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
