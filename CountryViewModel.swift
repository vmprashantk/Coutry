

import Foundation


class CountryViewModel{
    
    var filterArray = [CountryModel]()
    
    init() {
        
        filterArray = countryList
    }
    
    func prepareCountryList(){
        
        
        for dict in countryArray{
            
            let obj = CountryModel()
            obj.setCountryData(dict: dict)
            countryList.append(obj)
        }
    }
    
    
    func searchTextChange(txt:String){
        
        self.filterArray = countryList.filter({ (model) -> Bool in
            (model.countryName.lowercased().contains(txt.lowercased()))
        })
        
    }
    
    
    
    func searchDidCancel(){
        
        self.filterArray = countryList
    }
    
    
    func numberOfRows()->Int{
        
        return filterArray.count
    }
    
    func getCountryFlag(index:Int)->String{
        
        let obj = filterArray[index]
        return obj.countryFlag
    }
    
    func getCountryNameAt(index:Int)->String{
        
        let obj = filterArray[index]
        return obj.countryName
    }
    
    func getSelectedCountry(index:Int)->CountryModel{
        
        
        let obj = filterArray[index]
        return obj
    }
    
    
    
}
