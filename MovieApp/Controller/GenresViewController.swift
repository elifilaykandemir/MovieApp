//
//  Genres.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 29.08.2022.
//

import UIKit

class GenresViewController:SearchController<GenresData> {
    
    var tableView = UITableView()
    
    
    override func reloadViewData() {
        tableView.reloadData()
    }

  
    struct Cells{
        static let genreCell = "GenreCell"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchBar.delegate = self
        
        showSearchBarButton(show: true)
        configureTableView()
    
        fetch()
    }
    
    func fetch(){
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/genre/movie/list?api_key=\(NetworkManager.apiKey)") { (genresdata:GenresModel) in
            self.rawData = genresdata.genres
            self.filteredData = self.rawData
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.genreCell) as! GenresCell
        
        cell.cellStyle(genresTitleName: filteredData[indexPath.row].name,image:fetchData(index: indexPath.row) )
        return cell
    }
    
}

extension GenresViewController{
    
    func fetchData(index:Int) -> GenresImage{
        
        if index % 4 == 0{
            return GenresImage(image: GenresImagesData.drama)
        }
        else if index % 4 == 1{
            return GenresImage(image: GenresImagesData.adventure)
        }
        else if index % 4 == 2{
            return GenresImage(image: GenresImagesData.animation)
        }
        else if index % 4 == 3{
            return GenresImage(image: GenresImagesData.fantastic)
        }
        else {
            return GenresImage(image: GenresImagesData.fantastic)
            
        }
           
    }
}
