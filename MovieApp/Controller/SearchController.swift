//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 19.10.2022.
//

import UIKit

class SearchController :UIViewController{
    
    

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



}
