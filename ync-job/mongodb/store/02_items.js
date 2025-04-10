use store;

let data = undefined;

data = cat('assets/Quelconque.png', {encoding: 'base64'});
db.item.insertOne({
    id: "dummy",
    category: "None",
    image: BinData(0, "some-bin-dummy-string"),  // MongoDB uses Binary for blobs
    display_name: "Test",
    description: "Lorem ipsum dolor sit amet, consectetur adip",
    basket_description: "This should not be in a basket, how did you come so far?",
    price: 10.99  // MongoDB supports decimal for precise currency storage
});

data = cat('assets/Quelconque.png', {encoding: 'base64'});
db.item.insertOne({
    id: "quelconque",
    category: "quelconque",
    image: BinData(0, data),
    display_name: "Quelconque",
    description: "“Quelconque” est une photo prise au lac de Gradignan le 14 mars 2024. Alexandre et Victor jouent aux échecs, Alexis prend des photos. Le soleil se couche, il a déjà commencé à se cacher.",
    basket_description: "Livré avec son cadre photo aléatoire.",
    price: 10.99
});
