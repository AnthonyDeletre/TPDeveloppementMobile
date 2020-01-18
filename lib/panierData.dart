import 'package:scoped_model/scoped_model.dart'; 
import 'package:TPDeveloppementMobile/data.dart';

class PanierData extends Model{
  
  List<ProduitPanier> produits = new List();

  void deleteProduit(int id){
    for (var pp in produits) {
      if(pp.produit.id == id){
        produits.remove(pp);
        notifyListeners();
        break;
      }
    }
  }

  void updateProduit(int id, int quantite){
    for (var pp in produits) {
      if(pp.produit.id == id){
        pp.quantite = quantite;
        notifyListeners();
        break;
      }
    }
  }

  void addProduit(Produit p){
    for (var pp in produits) {
      if(pp.produit.id == p.id){ // Produit deja dans le panier
          updateProduit(pp.produit.id, pp.quantite + 1);
          notifyListeners();
          return;
      }
    }
    // Pas dans le panier
    produits.add(new ProduitPanier(p,1));
    notifyListeners();
  }

}