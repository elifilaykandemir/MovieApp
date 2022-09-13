//
//  Genres.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 29.08.2022.
//

import UIKit

class GenresViewController:UIViewController {
    
    // MARK:-
    var tableView = UITableView()
    var genres : [Genres] = []
    
    struct Cells{
        static let genreCell = "GenreCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search)
        configureTableView()
        genres = fetchData()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 170
        tableView.pin(to: view)
        tableView.register(GenresCell.self, forCellReuseIdentifier:Cells.genreCell)
        
        
    }
    func setTableViewDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension GenresViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.genreCell) as! GenresCell
        let genre = genres[indexPath.row]
        cell.set(genres: genre)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2.0
        cell.layer.masksToBounds = true
        return cell
    }
    
    
}

extension GenresViewController{
    
    func fetchData() -> [Genres]{
        let genres1 = Genres(image: GenresImages.drama, title: "Drama")
        let genres2 = Genres(image: GenresImages.adventure, title: "Adventure")
        let genres3 = Genres(image: GenresImages.animation, title: "Animation")
        let genres4 = Genres(image: GenresImages.fantastic, title: "Fantastic")
        let genres5 = Genres(image: GenresImages.drama, title: "Drama")
        let genres6 = Genres(image: GenresImages.adventure, title: "Adventure")
        let genres7 = Genres(image: GenresImages.animation, title: "Animation")
        let genres8 = Genres(image: GenresImages.fantastic, title: "Fantastic")
        let genres9 = Genres(image: GenresImages.drama, title: "Drama")
        let genres10 = Genres(image: GenresImages.adventure, title: "Adventure")
        return [genres1,genres2,genres3,genres4,genres5,genres6,genres7,genres8,genres9,genres10]
    }
}
