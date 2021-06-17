//
//  ViewControllerViewModel.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import Foundation

class ViewControllerViewModel : NSObject{
    
    private var apiService : APIManager!
    private(set) var productData : ProductData! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIManager()
        callFuncToGetProductData()
    }
    
    func callFuncToGetProductData() {
        self.apiService.dummyApiCall { (responseModel, error, statusCode) in
            if statusCode == "error" || statusCode == "fail" {
                print(statusCode)
                return
            } else {
                self.productData = responseModel
            }
        }
    }
}
