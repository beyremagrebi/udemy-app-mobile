import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import '../../providers/auth/login_view_model.dart';

class LoginFooterRow extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginFooterRow({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: viewModel.rememberMe,
                onChanged: (val) => viewModel.toggleRemember(value: val),
                checkColor: const Color(0xFF8B4A9C),
                fillColor: WidgetStateProperty.all(Colors.white),
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              Flexible(
                child: Text(
                  'Se souvenir de moi',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Dimensions.widthSmall,
        Flexible(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Mot de passe oublié ?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color.fromARGB(255, 227, 151, 247),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
