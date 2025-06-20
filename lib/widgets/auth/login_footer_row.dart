import 'package:flutter/material.dart';

import '../../providers/auth/login_view_model.dart';

class LoginFooterRow extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginFooterRow({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember me checkbox with text
        Row(
          children: [
            Checkbox(
              value: viewModel.rememberMe,
              onChanged: (bool? value) {
                viewModel.toggleRemmeber(value);
              },
              checkColor: const Color(0xFF8B4A9C),
              fillColor: WidgetStateProperty.all(Colors.white),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            Text(
              'Se souvenir de moi',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        // Forgot password link
        GestureDetector(
          onTap: () {},
          child: Text(
            'Mot de passe oublié ?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color.fromARGB(255, 227, 151, 247),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
