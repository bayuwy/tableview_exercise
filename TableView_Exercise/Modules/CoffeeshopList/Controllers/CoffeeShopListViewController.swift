//
//  CoffeeShopListViewController.swift
//  TableView_Exercise
//
//  Created by Bayu Yasaputro on 16/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var coffeeshops: [Coffeeshop] = [
        Coffeeshop(name: "Boja Eatery", type: "Coffeeshop / Cafe", location: "Jl. Pungkur", image: "bojaeatery", isFavorite: false),
        
        Coffeeshop(name: "Brewery Coffee", type: "Tea House", location: "Jl. Buahbatu", image: "brewery", isFavorite: false),
        
        Coffeeshop(name: "Casadela Coffee", type: "Cafe Shop", location: "Jl. Asia Afrika", image: "casadela", isFavorite: false),
        
        Coffeeshop(name: "Dago Terrace", type: "Home Coffee", location: "Jl. Sudirman", image: "dagoterrace", isFavorite: false),
        
        Coffeeshop(name: "Hola Koffie", type: "Coffeeshop / Cafe", location: "Jl. Setiabudi", image: "holakoffie", isFavorite: false),
        
        Coffeeshop(name: "Imah Kai", type: "Tea House", location: "Jl. Boscha", image: "imahkai", isFavorite: false),
        
        Coffeeshop(name: "Jiwan Kopi", type: "Cafe", location: "Jl. Sukabumi", image: "jiwan", isFavorite: false),
        
        Coffeeshop(name: "Kilogram Space", type: "Home Coffee", location: "Jl. Soekarno Hatta", image: "kilogram", isFavorite: false),
        
        Coffeeshop(name: "Masagi Coffee", type: "Bakery / Cafe", location: "Jl. Kopo", image: "masagi", isFavorite: false),
        
        Coffeeshop(name: "Nannys Pavillion", type: "Tea House / Cafe", location: "Jl. Dago", image: "nannys", isFavorite: false),
        
        Coffeeshop(name: "Sabana Kopi", type: "Coffeeshop / Bakery", location: "Jl. Cibiru", image: "sabanakopi", isFavorite: false),
        
        Coffeeshop(name: "Sini Kupi", type: "Coffeeshop / Milk House", location: "Jl. Aceh", image: "sinikupi", isFavorite: false),
        
        Coffeeshop(name: "Sonowae Kopi", type: "Coffeeshop / Cafe", location: "Jl. Cihapit", image: "sonowae", isFavorite: false),
        
        Coffeeshop(name: "Starbuck Coffee", type: "Bakery", location: "Jl. Gandapura", image: "starbuck", isFavorite: false),
        
        Coffeeshop(name: "Urra Cafe", type: "Warmindo", location: "Jl. Riau", image: "urracafe", isFavorite: false)
    ]
//    var favoritedCoffeeshops: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! CoffeeShopViewCell
        
        let coffeeshop = coffeeshops[indexPath.row]
        cell.thumbImageView.image = UIImage(named: coffeeshop.image)
        cell.nameLabel.text = coffeeshop.name
        cell.addressLabel.text = coffeeshop.location
        cell.categoryLabel.text = coffeeshop.type
        
        if coffeeshop.isFavorite {
            cell.favoriteImageView.isHidden = false
        }
        else {
            cell.favoriteImageView.isHidden = true
        }
        
        return cell
    }
    
    // MARK: - Helper Functions
    
    func reserveTable(_ index: Int) {
        let alert = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet.\nPlease try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    /*
    func isFavorited(_ index: Int) -> Bool {
//        return favoritedCoffeeshops.contains(where: { item in
//            return item == index
//        })
        return favoritedCoffeeshops.contains(where: { $0 == index })
    }
     */
    
    func toogleFavorite(_ index: Int) {
        if coffeeshops[index].isFavorite {
            coffeeshops[index].isFavorite = false
        }
        else {
            coffeeshops[index].isFavorite = true
        }
        
//        let idx = favoritedCoffeeshops.firstIndex(where: { item in return item == index })
//        if idx != nil {
//            favoritedCoffeeshops.remove(at: idx!)
//        }
//        else {
//            favoritedCoffeeshops.append(index)
//        }
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Reserve a table", style: UIAlertAction.Style.default, handler: { alert in
            self.reserveTable(indexPath.row)
        }))
        
        if coffeeshops[indexPath.row].isFavorite {
            actionSheet.addAction(UIAlertAction(title: "Remove from favorite", style: .default, handler: { _ in
                self.toogleFavorite(indexPath.row)
            }))
        }
        else {
            actionSheet.addAction(UIAlertAction(title: "Mark as favorite", style: .default, handler: { _ in
                self.toogleFavorite(indexPath.row)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            coffeeshops.remove(at: indexPath.row)
//            coffeeshopNames.remove(at: indexPath.row)
//            coffeeshopTypes.remove(at: indexPath.row)
//            coffeeshopLocations.remove(at: indexPath.row)
//            coffeeshopImage.remove(at: indexPath.row)
            
//            if let idx = favoritedCoffeeshops.firstIndex(where: { item in return item == indexPath.row }) {
//                favoritedCoffeeshops.remove(at: idx)
//            }
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
             
        default:
            break
        }
    }
}
