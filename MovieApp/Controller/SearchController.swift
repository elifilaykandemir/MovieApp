//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 19.10.2022.
//

import UIKit

class SearchController<T:Decodable & Searchable>:UIViewController,UISearchBarDelegate{
    
    var rawData = [T]()
    var filteredData : [T] = []
    
    lazy var searchBar : UISearchBar = {
        var searchbar = UISearchBar()
        searchbar.placeholder = " Search..."
        searchbar.sizeToFit()
        return searchbar
    }()
    
    @objc func handleShowSearchBar(){
        search(shouldshow: true)
        searchBar.becomeFirstResponder()
    }

    func showSearchBarButton(show:Bool){
        if show {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        }else{
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldshow:Bool){
        showSearchBarButton(show: !shouldshow)
        searchBar.showsCancelButton = shouldshow
        self.navigationItem.titleView = shouldshow ? searchBar : nil
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldshow: false)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? rawData : rawData.filter{$0.controlledSearhableText(text: searchText)}
        reloadViewData()
    }
    public func reloadViewData(){
        
    }
    }
