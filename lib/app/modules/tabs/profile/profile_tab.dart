import 'package:flutter/material.dart';
import 'package:greengrocer/app/core/widgets/custom_text_field.dart';
import 'package:greengrocer/app/core/data/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: app_data.user.name,
            readOnly: true,
          ),
          // Email
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
            initialValue: app_data.user.email,
            readOnly: true,
          ),
          // Celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            initialValue: app_data.user.phone,
            readOnly: true,
          ),
          // CPF
          CustomTextField(
            icon: Icons.copy,
            label: 'CPF',
            isSecret: true,
            initialValue: app_data.user.cpf,
            readOnly: true,
          ),
          // Botão atualizar senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  updatePassword();
                },
                child: const Text('Atualizar senha')),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Senha atual
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha atual',
                        isSecret: true,
                      ),
                      // Nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova senha ',
                        isSecret: true,
                      ),
                      // Confirmar nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        isSecret: true,
                      ),

                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {},
                            child: const Text('Atualizar')),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ))
              ],
            ),
          );
        });
  }
}
