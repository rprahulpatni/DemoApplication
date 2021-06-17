//
//  ViewController.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var tblView: UITableView!
    
    //Variables
    private var productViewModel : ViewControllerViewModel!
    
    lazy var searchBar:UISearchBar = UISearchBar()
    var arrProductData: [Product]! = []
    var arrFilter: [Product]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        tblView.tableFooterView = UIView()
        tblView.keyboardDismissMode = .onDrag
        
        //Api Call using View Model
        self.callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.productViewModel =  ViewControllerViewModel()
        self.productViewModel.bindViewModelToController = {
            self.arrProductData = self.productViewModel.productData.data
            self.arrFilter = self.productViewModel.productData.data
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
}

//Searching
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        arrFilter = []
        if textSearched != "" {
            self.arrFilter = self.arrProductData.filter {
                return $0.product_name?.range(of: textSearched, options: .caseInsensitive) != nil
            }
        } else {
            self.arrFilter = self.arrProductData
        }
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}



