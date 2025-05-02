import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';
import '../pages/post_list_page.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            context.read<UserBloc>().add(GetUsersEvent());
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(user.email),
                        const SizedBox(height: 2),
                        Text(user.phone),
                        const SizedBox(height: 2),
                        Text(
                          user.website,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostListPage(userId: user.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}
