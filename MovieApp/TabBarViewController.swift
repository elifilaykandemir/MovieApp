//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 30.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .black
        viewControllers = [createDiscoverNC(),createGenresNC(),createArtistNC()]
        
    }
    
    func createGenresNC() -> UINavigationController{
        let genresVC = GenresViewController()
        genresVC.title = "Genres"
        genresVC.tabBarItem.tag = 1
        genresVC.tabBarItem.image = UIImage(named:"genres")
        return UINavigationController(rootViewController: genresVC)
    }
    
    func createDiscoverNC() -> UINavigationController{
        let discoverVC = DiscoverViewController()
        discoverVC.title = "Discover"
        discoverVC.tabBarItem.tag = 0
        discoverVC.tabBarItem.image = UIImage(named:"discover")
        return UINavigationController(rootViewController: discoverVC)
    }
    
    func createArtistNC() -> UINavigationController{
        let artistVC = ArtistViewController()
        artistVC.title = "Artists"
        artistVC.tabBarItem.tag = 2
        artistVC.tabBarItem.image = UIImage(named:"artists")
        return UINavigationController(rootViewController: artistVC)
    }
    
    
 }
   


