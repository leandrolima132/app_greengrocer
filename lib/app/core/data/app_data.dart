import 'package:greengrocer/app/core/models/item_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Maçã',
  imgUrl: 'assets/fruits/apple.png',
  unit: 'kg',
  price: 3.5,
  description:
      'Maçãs frescas e crocantes, direto do pomar, ricas em sabor e qualidade.',
);

ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/fruits/grape.png',
  unit: 'kg',
  price: 3.5,
  description:
      'Uvas suculentas e doces, perfeitas para consumo direto ou para sucos naturais.',
);

ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/fruits/guava.png',
  unit: 'uni',
  price: 2.2,
  description:
      'Goiabas maduras e aromáticas, com polpa suculenta e alto teor de vitamina C.',
);

ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/fruits/kiwi.png',
  unit: 'kg',
  price: 4.0,
  description:
      'Kiwis frescos e nutritivos, com sabor exótico e ricos em fibras e vitaminas.',
);

ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/fruits/mango.png',
  unit: 'kg',
  price: 7.8,
  description:
      'Mangas doces e carnudas, selecionadas no ponto ideal de maturação.',
);

ItemModel papaya = ItemModel(
  itemName: 'Mamão',
  imgUrl: 'assets/fruits/papaya.png',
  unit: 'kg',
  price: 5.0,
  description:
      'Mamões frescos e macios, com polpa adocicada e excelentes propriedades digestivas.',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];
