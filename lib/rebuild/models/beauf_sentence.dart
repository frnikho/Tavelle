import 'dart:math';

List<String> beaufSentence = [
  "Bière qui roule, n'amasse pas mousse",
  "Avec le blanc tout fout le camp",
  "Celui qui boit pas, c'est celui qui nettoie",
  "C'est le dernier... avant le prochain",
  "L'alcool est un ennemi... et fuir un ennemi c'est lâche",
  "Vomir, c'est repartir",
  "Manger liquide, manger rapide",
  "Bière avalée, bière urinée",
  "Conduis bien, conduis plein",
  "Ya pire que boire pour oublier, c'est oublier de boire",
  "Pour savoir qu'un verre était trop de trop, encore faut-il l'avoir bu",
  "Le coeur a ses raisons que le Ricard ignore",
  "Blanc sur rouge, rien ne bouge",
  "Pastis par temps bleu, pastis délicieux",
  "Encore un que les boches n'auront pas",
  "On n'est pas là pour enculer les mouches",
  "Petit pêt du matin, neige sur les sapins"
];

List<String> resultSentence = [
  "bébére il a fait mieux hier ...",
  "ca fait beaucoup la non ?",
  "ya encore de la place pour un pti dernier",
];

List<String> driveSentence = [
  "a full patate",
  "a toute berzingue",
  "l'auto du seigneure est a toi",
  "Si ta pas le permit probatoire, tu peut y aller",
  "Interdiction de prendre l'auto",
];

String getDriveSentence(double alcohol) {
  if (alcohol < 0.2) {
    return driveSentence[Random().nextInt(3)];
  } else if (alcohol < 0.5) {
    return driveSentence[2];
  } else {
    return driveSentence[3];
  }
}

String getRandomResultSentence() => resultSentence[Random().nextInt(resultSentence.length)];
String getRandomBeaufSentence() => beaufSentence[Random().nextInt(beaufSentence.length)];