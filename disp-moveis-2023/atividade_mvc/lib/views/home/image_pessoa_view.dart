import 'package:flutter/material.dart';


// Esta classe é responsável por definir 
// as propriedades da imagem da tela incial.
class ImageHomeView extends StatelessWidget {
  const ImageHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/people.png',
      height: MediaQuery.of(context).size.height * 0.3,
      fit: BoxFit.cover,
    );
  }
}
