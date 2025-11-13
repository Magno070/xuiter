import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:xuiter/app/auth/datasources/auth_data_source_impl.dart';
import 'package:xuiter/app/auth/repositories/auth_repository_impl.dart';
import 'package:xuiter/app/vertical_navigator/navigation_args.dart';
import 'package:xuiter/app/vertical_navigator/navigator_widget.dart';
import 'package:xuiter/app/vertical_navigator/vertical_navigator_viewmodel.dart';

class VerticalNavigatorView extends StatelessWidget {
  const VerticalNavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerticalNavigatorViewModel(
        authRepository: AuthRepositoryImpl(dataSource: AuthDataSourceImpl()),
      ),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VerticalNavigatorViewModel>();
    List<NavigationArgs> args = [
      NavigationArgs(
        text: "Perfil",
        icon: Icons.person,
        onTap: () {
          if (context.mounted) {
            context.go('/profile');
          }
        },
      ),
    ];

    List<NavigationArgs> bottomArgs = [
      NavigationArgs(
        text: "Sair",
        icon: Icons.exit_to_app,
        onTap: () {
          if (context.mounted) {
            viewModel.logOut().then((_) {
              if (context.mounted) context.go('/login');
            });
          }
        },
      ),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: DrawerHeader(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                duration: Duration(seconds: 3),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: Image.asset(
                        'images/banner_placeholder.webp',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: args.length,
                itemBuilder: (context, index) {
                  return NavigatorWidget(
                    text: args[index].text,
                    icon: args[index].icon,
                    label: args[index].label,
                    onTap:
                        args[index].onTap ??
                        () {
                          debugPrint(args[index].text);
                        },
                  );
                },
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 50, 50, 50),
              child: Column(
                children: bottomArgs.map((arg) {
                  return NavigatorWidget(
                    text: arg.text,
                    icon: arg.icon,
                    label: arg.label,
                    onTap:
                        arg.onTap ??
                        () {
                          debugPrint(arg.text);
                        },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
