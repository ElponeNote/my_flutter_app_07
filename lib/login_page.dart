import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _authService.currentUser;
  }

  void _updateUser() {
    setState(() {
      _user = _authService.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Google 로그인 테스트')),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: () async {
                  await _authService.signInWithGoogle();
                  _updateUser();
                },
                child: const Text('Google로 로그인'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: _user!.photoURL != null ? NetworkImage(_user!.photoURL!) : null,
                    radius: 40,
                  ),
                  const SizedBox(height: 16),
                  Text('로그인됨: ${_user!.displayName ?? _user!.email}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await _authService.signOut();
                      _updateUser();
                    },
                    child: const Text('로그아웃'),
                  ),
                ],
              ),
      ),
    );
  }
} 