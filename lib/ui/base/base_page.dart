// import 'package:flutter/material.dart';
//
// abstract class BasePageState<T extends StatefulWidget,
//     VM extends ChangeNotifier> extends State<T> {
//   final VM _viewModel = serviceLocator<VM>();
//
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   VM get viewModel => _viewModel;
//
//   get scaffoldKey => _scaffoldKey;
//
//   Widget buildBodyDesktop(BuildContext context, VM vm);
//
//   Widget buildBodyMobile(BuildContext context, VM vm);
//
//   //Widget buildBody(BuildContext context, VM vm);
//
//   // Widget buildDrawer();
//
//   PreferredSize buildAppBar();
//
//   void loadPageData({dynamic value});
//
//   @override
//   void initState() {
//     loadPageData();
//     super.initState();
//   }
//
//   // Future<bool> provideOnWillPopScopeCallBack();
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//         value: viewModel,
//         child: Scaffold(
//             //backgroundColor: scaffoldColor,
//             key: _scaffoldKey,
//             appBar: buildAppBar(),
//             // drawer: buildDrawer(),
//             body: ScreenTypeLayout(
//               breakpoints: const ScreenBreakpoints(
//                   tablet: 800, desktop: 800, watch: 300),
//               mobile: buildBodyMobile(context, viewModel),
//               desktop: buildBodyDesktop(context, viewModel),
//             )
//             // ResponsiveBuilder(
//             //     builder: (_, info) => (info.isMobile)
//             //         ? buildBodyMobile(context, viewModel)
//             //         : buildBodyDesktop(context, viewModel)
//             //     //buildBody(context, viewModel),
//             //     ),
//             ));
//   }
// }
