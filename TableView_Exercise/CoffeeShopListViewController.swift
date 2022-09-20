//
//  CoffeeShopListViewController.swift
//  TableView_Exercise
//
//  Created by Bayu Yasaputro on 16/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var coffeeshopNames = ["Boja Eatery", "Brewery Coffee", "Casadela Coffee", "Dago Terrace", "Hola Koffie", "Imah Kai", "Jiwan Kopi", "Kilogram Space", "Masagi Coffee", "Nannys Pavillion", "Sabana Kopi", "Sini Kupi", "Sonowae Kopi", "Starbuck Coffee", "Urra Cafe"]
    
    var coffeeshopImage = ["bojaeatery", "brewery", "casadela", "dagoterrace", "holakoffie", "imahkai", "jiwan", "kilogram", "masagi", "nannys", "sabanakopi", "sinikupi", "sonowae", "starbuck", "urracafe"]
    
    var coffeeshopLocations = ["Jl. Pungkur", "Jl. Buahbatu", "Jl. Asia Afrika", "Jl. Sudirman", "Jl. Setiabudi", "Jl. Boscha", "Jl. Sukabumi", "Jl. Soekarno Hatta", "Jl. Kopo", "Jl. Dago", "Jl. Cibiru", "Jl. Aceh", "Jl. Cihapit", "Jl. Gandapura", "Jl. Riau"]
    
    var coffeeshopTypes = ["Coffeeshop / Cafe", "Tea House", "Cafe Shop", "Home Coffee", "Coffeeshop / Cafe", "Tea House", "Cafe", "Home Coffee", "Bakery / Cafe", "Tea House / Cafe", "Coffeeshop / Bakery", "Coffeeshop / Milk House", "Coffeeshop / Cafe", "Bakery", "Warmindo"]
    
    var favoritedCoffeeshops: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshopNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! CoffeeShopViewCell
        
        cell.thumbImageView.image = UIImage(named: coffeeshopImage[indexPath.row])
        cell.nameLabel.text = coffeeshopNames[indexPath.row]
        cell.addressLabel.text = coffeeshopLocations[indexPath.row]
        cell.categoryLabel.text = coffeeshopTypes[indexPath.row]
        
        if favoritedCoffeeshops.contains(where: { index in return index == indexPath.row }) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - Helper Functions
    
    func reserveTable(_ index: Int) {
        let alert = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet.\nPlease try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func toogleFavorite(_ index: Int) {
        favoritedCoffeeshops.append(index)
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
        
        actionSheet.addAction(UIAlertAction(title: "Mark as favorite", style: .default, handler: { _ in
            self.toogleFavorite(indexPath.row)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
        
    }
}
