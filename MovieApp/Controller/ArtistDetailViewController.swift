import UIKit

class ArtistDetailViewController:UIViewController{
//    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg"
//    let imageUrl = "https://image.tmdb.org/t/p/original"
//    let cache = NSCache<NSNumber, UIImage>()
//    var artistBiography = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 14)
//    var artistName = ""
//    var birthday = ""
//    var knownforDepartman = ""
//    static var totalPhoto: Int = 0
//    var rawData = [ArtistDetailImages]()
    
    lazy var artistImages = GridImageView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height*1/2))
    
    lazy var segmentedController:UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Summary","Movies"])
        sc.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        
        return sc
    }()
//
//    func displaySummmary(){
//        if segmentedController.selectedSegmentIndex == 0{
//            view.addSubview(artistBiography)
//            artistBiography.textColor = .black
//            artistBiography.textAlignment = .left
////            artistBiography.addConstraint(top: segmentedController.bottomAnchor, left:view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
//        }
//
//    }
//
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            artistImages.artistBiography.isHidden = false

        case 1:
            artistImages.artistBiography.isHidden = true
        default:
            break
        }
    }
    func setupSegmentedController(){
        segmentedController.addConstraint(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop:view.frame.height*1/2, paddingLeft: 0, paddingBottom:view.frame.height*0.45, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        //fetchPopularArtistsData()
        view.addSubview(artistImages)
        view.addSubview(segmentedController)
        setupSegmentedController()
        
//        displaySummmary()
    }
    
//    func fetchPopularArtistsData(){
//
//        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)/images?api_key=\(NetworkManager.apiKey)") { (artistimagedata:ArtistDetailed) in
//
//            self.rawData = artistimagedata.profiles
//            ArtistDetailViewController.totalPhoto = self.rawData.count
//            print(self.rawData[0].file_path)
//            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
//            CacheManager.sharedInstance.getImage(imageAdress:self.rawData[0].file_path , completion:{[weak self] image in
//
//                self?.artistImages.topImageView.image = image
//            } )
//        }
//
//        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)?api_key=\(NetworkManager.apiKey)") { (artistdata:ArtistInformation) in
//
//            self.artistBiography.text = artistdata.biography!
//            self.birthday = artistdata.birthday!
//
//            self.artistName = artistdata.name!
//            self.knownforDepartman = artistdata.known_for_department!
//
//
//        }
//    }
    
    
    
}
