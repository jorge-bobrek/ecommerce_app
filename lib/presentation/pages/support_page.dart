import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelWidget(
                text: 'Contacto y Soporte',
                size: 24,
              ),
              SizedBox(height: 20),
              LabelWidget(
                text: 'Correo Electrónico:',
                size: 20,
              ),
              SizedBox(height: 5),
              TextWidget(
                text: 'soporte@losrecuerdosdeella.com',
                size: 18,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              LabelWidget(
                text: 'Número de Teléfono:',
                size: 20,
              ),
              SizedBox(height: 5),
              TextWidget(
                text: '+57 575 1234',
                size: 18,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              LabelWidget(
                text: 'Horario de Atención:',
                size: 20,
              ),
              SizedBox(height: 5),
              TextWidget(
                text:
                    'Lunes a Viernes: 9:00 AM - 6:00 PM\nSábado: 10:00 AM - 4:00 PM',
                size: 18,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 20),
              Text(
                'Dirección:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextWidget(
                text: '123 Calle Principal, Ciudad, País',
                size: 18,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 20),
              LabelWidget(
                text: 'Redes Sociales:',
                size: 20,
              ),
              SizedBox(height: 5),
              IconLabelColorWidget(
                icon: FontAwesomeIcons.whatsapp,
                text: '+57 3112345678',
                size: 18,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              IconLabelColorWidget(
                icon: FontAwesomeIcons.instagram,
                text: 'instagram.com/losrecuerdosdeella',
                size: 18,
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              IconLabelColorWidget(
                icon: FontAwesomeIcons.facebook,
                text: 'facebook.com/losrecuerdosdeella',
                size: 18,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              IconLabelColorWidget(
                icon: FontAwesomeIcons.tiktok,
                text: 'tiktok.com/losrecuerdosdeella',
                size: 18,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              IconLabelColorWidget(
                icon: FontAwesomeIcons.xTwitter,
                text: 'x.com/losrecuerdosdeella',
                size: 18,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
