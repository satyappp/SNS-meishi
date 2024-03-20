import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFireOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Myapp,MyHomePageはデフォルトから変更がないため省略

class _MyHomePageState extends State<MyHomePage> {
  // 入力したメールアドレス、パスワード
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 1行目メールアドレス入力用テキストフィールド
              TextFormField(
                decoration: const InputDecoration(labelText: 'email Addres'),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              // ２行目 パスワード入力用テキストフィールド
              TextFormField(
                decoration: const InputDecoration(labelText: 'password'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              // 3行目 ユーザー登録ボタン
              ElevatedButton(
                child: const Text('ユーザー登録'),
                onPressed: () async {
                  try {
                    final User? user = (await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password))
                        .user;
                    if (user != null)
                      print('ユーザー登録しました ${user.email} ,${user.uid}');
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              // ４行目 ログインボタン
              ElevatedButton(
                child: const Text('Log In'),
                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    final User? user = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password))
                        .user;
                    if (user != null)
                      print('ログインしました ${user.email} ,${user.uid}');
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              // ５行目 パスワードリセット登録ボタン
              ElevatedButton(
                  child: const Text('password reset'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasseordResetEmail(email: _email);
                      print('パスワードリセット用のメールを送信しました');
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
