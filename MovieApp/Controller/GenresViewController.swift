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
    var filteredData : [String] = []
    var titleData : [String] = []
    var genrescell = GenresCell()
    
    
    
    lazy var searchBar : UISearchBar = {
        var searchbar = UISearchBar()
        searchbar.placeholder = " Search..."
        searchbar.delegate = self
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

  
    struct Cells{
        static let genreCell = "GenreCell"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        //self.navigationItem.rightBarButtonItem = searchBarButtonItem
        showSearchBarButton(show: true)
        configureTableView()
        genres = fetchData()
        fetch()
    }
    
    func fetch(){
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/genre/movie/list?api_key=\(NetworkManager.apiKey)") { (genresdata:GenresModel) in
            self.genresTitleName = genresdata.genres
            for i in 0 ..< self.genresTitleName.count{
                self.titleData.append(self.genresTitleName[i].name)
            }
            self.filteredData = self.titleData
            //self.genresTitleName = genresdata.genres.map{$0.image=Int.random(in: 0...4)}
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
        cell.cellStyle(index:indexPath.row,genresTitleName: filteredData,genres: genres)
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

extension GenresViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldshow: false)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? titleData : titleData.filter {(item:String) -> Bool in
            return item.range(of: searchText , options: .caseInsensitive , range: nil , locale: nil) != nil
        }
        tableView.reloadData()
    }
    }
