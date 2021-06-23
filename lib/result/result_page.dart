import 'package:flutter/material.dart';
import 'package:quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quiz/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({Key key, this.title, this.length, this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (result == length) Image.asset(AppImages.trophy),
          if (result < length) Image.asset(AppImages.error),
          Column(
            children: [
              if (result == length)
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
              if (result < length)
                Text(
                  "Errou!",
                  style: AppTextStyles.heading40,
                ),
              SizedBox(
                height: 16,
              ),
              Text.rich(
                TextSpan(
                    text: "Você concluiu o modulo",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n $title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\nacertou $result de $length ",
                        style: AppTextStyles.body,
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  if (result == length)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share('Parabéns acertou $result questões do seu quiz!');
                          },
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.transparent(
                        label: "Voltar ao início",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
