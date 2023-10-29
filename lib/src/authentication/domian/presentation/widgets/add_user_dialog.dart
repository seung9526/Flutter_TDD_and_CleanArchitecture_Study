import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toy/src/authentication/domian/presentation/cubit/authentication_cubit.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'username',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    const avatar = 'https://cloudflare-ipfs.com/ipfs/'
                        'Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/443.jpg';
                    final name = nameController.text.trim();
                    context.read<AuthenticationCubit>().createUser(createdAt: DateTime.now().toString(),
                        name: name,
                        avatar: avatar,
                    );
                  },
                  child: const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
