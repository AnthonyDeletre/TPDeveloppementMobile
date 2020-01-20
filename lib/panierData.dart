import 'package:scoped_model/scoped_model.dart'; 
import 'package:DelivrEcrous/data.dart';

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

  String getQuantiteByProduit(int id){
    for (var pp in produits) {
      if(pp.produit.id == id){
          return pp.quantite.toString();
      }
    }
    return "0";
  }

  void decrementQuantitePP(ProduitPanier pp){
    if(pp.quantite > 0)
      pp.quantite--;
    if(pp.quantite == 0)
      deleteProduit(pp.produit.id);
    else
      notifyListeners();  
  }

   void incrementQuantitePP(ProduitPanier pp){
    pp.quantite++;
    notifyListeners();  
  }

  void incrementQuantite(int id){
    for (var pp in produits) {
      if(pp.produit.id == id){
          incrementQuantitePP(pp);
          return;
      }
    }
  }

  void decrementQuantite(int id){
    for (var pp in produits) {
      if(pp.produit.id == id){
          decrementQuantitePP(pp);
          return;
      }
    }
  }

  void addProduit(Produit p){
    for (var pp in produits) {
      if(pp.produit.id == p.id){
          incrementQuantitePP(pp);
          return;
      }
    }
    // Pas dans le panier
    produits.add(new ProduitPanier(p,1));
    notifyListeners();
  }

}