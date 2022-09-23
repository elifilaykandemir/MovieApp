//
//  Genres.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 29.08.2022.
//

import UIKit

class GenresViewController:UIViewController {
    
    var tableView = UITableView()
    var genres : [GenresImage] = []
    var genresTitleName = [GenresData]()
    
    
    struct Cells{
        static let genreCell = "GenreCell"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search)
        configureTableView()
        genres = fetchData()
        
        fetch()
        
        
    }
    func fetch(){
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/3/genre/movie/list?api_key=\(NetworkManager.apiKey)") { (genresdata:GenresModel) in
            self.genresTitleName = genresdata.genres
            //self.genresTitleName = genresdata.genres.map{$0.image=Int.random(in: 0...4)}
            
        }
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
        return genresTitleName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.genreCell) as! GenresCell
        cell.cellStyle(index:indexPath.row,genresTitleName: genresTitleName,genres: genres)

        return cell
    }
    
    
    
}

extension GenresViewController{
    
    func fetchData() -> [GenresImage]{
        
        let genres1 = GenresImage(image: GenresImagesData.drama)
        let genres2 = GenresImage(image: GenresImagesData.adventure)
        let genres3 = GenresImage(image: GenresImagesData.animation)
        let genres4 = GenresImage(image: GenresImagesData.fantastic)
        

        return [genres1,genres2,genres3,genres4,genres1,genres2,genres3,genres4,genres1,genres2,genres3,genres4,genres1,genres2,genres3,genres4,genres1,genres2,genres3,genres4]
    }
}
