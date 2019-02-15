

import UIKit

protocol countryProtocol {
    func getCountry(data:CountryModel)
}


class CountryVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tblView: UITableView!
    
    
    // MARK:- Variable Declartion
    
    let obj = CountryViewModel()
    var objDelegate:countryProtocol? = nil
    
   // var emptyView = EmptyTableView()
    
    let objIndicator = Indicator()
    
    
    
    // MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
      
        tblView.dataSource = self
        tblView.delegate = self
        
    }

    
    
    
    
    // MARK:- Intialize Empty View
//    func intializeEmptyView(){
//
//        if(Bundle.main.loadNibNamed("EmptyTableView", owner: self, options: nil)?.first as?  EmptyTableView != nil){
//            emptyView = Bundle.main.loadNibNamed("EmptyTableView", owner: self, options: nil)?.first as! EmptyTableView
//            emptyView.lblText.text = "No data found"
//            emptyView.imgView.image = #imageLiteral(resourceName: "dyotTabSelectedImage")
//            tblViewCountry.backgroundView = emptyView
//        }
//    }
    // MARK:- SearchBar Delegate methods
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        obj.searchDidCancel()
        tblView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty){
            
            obj.searchDidCancel()
            
        }
        else{
            
            obj.searchTextChange(txt: searchText)
            
        }
        tblView.reloadData()
    }
    
    // MARK:- Back Button Action
    
    @IBAction func btnBackAction(_ sender: Any) {
        
       self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- TableView DataSource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(obj.numberOfRows() == 0){
            
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        }
        else{
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        }
        return obj.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        cell?.textLabel?.text = "\(obj.getCountryFlag(index: indexPath.row))    \(obj.getCountryNameAt(index: indexPath.row))"
        cell?.textLabel?.textColor = UIColor.white
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let countryData = obj.getSelectedCountry(index: indexPath.row)
        objDelegate?.getCountry(data: countryData)
        self.dismiss(animated: true, completion: nil)
        
    }
}
