
class ProduitPanier {
  Produit produit;
  int quantite;

  ProduitPanier(this.produit, this.quantite);


}

class Produit {

  final int id;
  final String imgPath;
  final String name;
  final double price;
  final String description;

  Produit(this.id, this.imgPath, this.name, this.price, this.description);

}

List<Produit> getListProduit(){

  final List<Produit> list = new List();

  list.add(new Produit(1,'assets/images/ecrou-borgne-hexagonal.png', 'Ecrou Borgne Hexagonal', 6.25, 'Ces écrous sont non débouchants, c’est-à-dire que le trou taraudé n’existe que d’un côté. Ces écrous protègent et cachent le filetage de la vis, à des fins d’esthétique ou de sécurité.'));
  list.add(new Produit(2,'assets/images/ecrou-a-sertir.png', 'Ecrou à Sertir', 5.50, 'Ce type d’écrou est parfois aussi appelé « écrou autosertissable »'));
  list.add(new Produit(3,'assets/images/ecrou-papillon.png', 'Ecrou Papillon', 6.25, 'Également connu sous le nom d’écrou à oreilles, l’écrou papillon se démarque des autres écrous par ses extrémités un peu relevées, à la manière des ailes de papillon. L’autre particularité de ce type d’écrou est que la manœuvre de serrage peut se faire manuellement.'));
  list.add(new Produit(4,'assets/images/ecrou-cylindrique.png', 'Ecrou Cylindrique', 5.50, 'L’écrou cylindrique est particulièrement utilisé en serrage mécanique. Il se caractérise par sa forme arrondie et l’énorme trou circulaire qui se trouve en son milieu. Ce type d’écrou se distingue également par son diamètre intérieur fileté qui s’adapte parfaitement au filetage extérieur des vis.'));
  list.add(new Produit(5,'assets/images/ecrou-a-creneau.png', 'Ecrou à Créneaux', 6.25, 'L’écrou à créneaux est un modèle d’écrou utilisé avec une goupille fendue afin d’éviter le desserrage des fixations. Ce type d’écrou est surtout utilisé pour les fixations délicates qui requièrent une grande résistance.'));
  list.add(new Produit(6,'assets/images/ecrou-a-embase.png', 'Ecrou à Embase', 5.50, 'Ce type d’écrou se distingue des autres par le fait qu’il possède une collerette c’est-à-dire qu’il a une rondelle soudée au niveau de la tête. Cette embase remplace la rondelle généralement apposée à l’écrou, ce qui lui procure une plus grande surface de contact.'));
  list.add(new Produit(7,'assets/images/ecrou-antivol.png', 'Ecrou Antivol', 6.25, 'L’écrou antivol se caractérise par son empreinte particulière en forme de fleur ou d’étoile. Ce type d’écrou sert uniquement à fixer les jantes sur les roues. Comme son nom l’indique, il permet de préserver les jantes et les roues des éventuels voleurs.'));
  list.add(new Produit(8,'assets/images/ecrou-hexagonal.png', 'Ecrou Hexagonal', 5.50, 'Ce type d’écrou est le modèle le plus fréquent. Il se démarque par la forme hexagonale de sa périphérie. La distance entre les deux faces de l’écrou correspond en millimètre à la taille de la clé nécessaire au serrage. À titre d’exemple, pour un écrou hexagonal M3, le type de clé indispensable est la clé 5,5. Vous pouvez vous servir de cette mesure pour sélectionner la taille d’écrou qui vous est indispensable.'));
  list.add(new Produit(9,'assets/images/ecrou-frein.png', 'Ecrou Frein', 6.25, 'Écrous freinés : comportant un système destiné à empêcher un desserrage accidentel par les vibrations'));
  list.add(new Produit(10,'assets/images/ecrou-cage.png', 'Ecrou Cage', 5.50, 'Un écrou cage est un écrou carré emprisonné dans une cage munie sur une face de deux pattes précintrées.'));
  list.add(new Produit(11,'assets/images/ecrou-carre.png', 'Ecrou Carré', 5.50, 'Ce sont des écrous offrant une prise en clé plus importante. Aujourd’hui ils sont principalement utilisés comme Écrou cage (baies informatiques, carrosserie, etc.), lorsqu’une fois le montage terminé, l’accès à l’écrou devient impossible (montage borgne) et que l’épaisseur de métal est insuffisante pour permettre un taraudage solide. Autrefois ils étaient recommandés pour des usages avec risque de grippage ou permettaient l’emploi d’acier moins résistant.'));
  list.add(new Produit(12,'assets/images/1324688769001.jpg', 'Ecrou mega long pour test les retours a la ligne', 4.20, 'C’est\nun\nécrou\nde\ntest.\nCirculez\ny’a\nrien\nà\nvoir'));


  return list;
}