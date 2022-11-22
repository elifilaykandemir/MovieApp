//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 30.08.2022.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    var discoverTableView = UITableView()


    func configureTableView(){
        discoverTableView.separatorStyle = .none
        view.addSubview(discoverTableView)
        setTableViewDelegate()
        discoverTableView.pin(to: view)
        discoverTableView.register(DiscoverTableCell.self, forCellReuseIdentifier:DiscoverTableCell.identifier)
        discoverTableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)
    }
    
    func setTableViewDelegate(){
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search)
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTableView.frame = view.bounds
    }
}

extension DiscoverViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverTableCell.identifier, for: indexPath) as! DiscoverTableCell
        cell.discoverCollectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as? TableViewHeader
        if section == 0 {
            header?.configure(text: "Most Popular")
        }else if section == 1 {
            header?.configure(text: "Most Recent")
        }else if section == 2 {
            header?.configure(text: "Comming Soon")
        }
        return header
    }
    
class TableViewHeader:UITableViewHeaderFooterView{
    
    static let identifier = "TableHeader"
    
    lazy var sectiontitle : UILabel = {
        let label = UILabel()
        label.text = "Most Popular"
        label.textColor = UIColor(named: "black")
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
        
    lazy var discoverButton : UIButton = {
        let button = UIButton()
        button.setTitle("See All >", for: .normal)
        button.setTitleColor(UIColor(named: "buttonblue"), for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleGothic", size: 15)
        button.titleLabel?.textAlignment = .right
        return button
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sectiontitle)
        contentView.addSubview(discoverButton)
        
    }
    
    func configure(text: String){
        sectiontitle.text = text
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sectiontitle.sizeToFit()
        discoverButton.sizeToFit()
        sectiontitle.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width/2, height: sectiontitle.frame.size.height)
        discoverButton.frame = CGRect(x: contentView.frame.size.width/2+contentView.frame.size.width/3, y: 0, width: contentView.frame.size.width/6, height: sectiontitle.frame.size.height)
    }
}
}
