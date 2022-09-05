//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 30.08.2022.
//

import UIKit

class TabBarViewController: UIViewController{
    
   
    func createGenresNC() -> UINavigationController{
        let genresVC = GenresViewController()
        genresVC.title = "Genres"
        genresVC.tabBarItem.tag = 1
        return UINavigationController(rootViewController: genresVC)
    }
    
    func createDiscoverNC() -> UINavigationController{
        let discoverVC = DiscoverViewController()
        discoverVC.title = "Discover"
        discoverVC.tabBarItem.tag = 0
        return UINavigationController(rootViewController: discoverVC)
    }
    
    func createArtistNC() -> UINavigationController{
        let artistVC = ArtistViewController()
        artistVC.title = "Artists"
        artistVC.tabBarItem.tag = 2
        return UINavigationController(rootViewController: artistVC)
    }
    
    func createTabBar()->UITabBarController{
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .black
        tabBar.viewControllers = [createDiscoverNC(),createGenresNC(),createArtistNC()]
        return tabBar
    }
    
    
  
 }
   


