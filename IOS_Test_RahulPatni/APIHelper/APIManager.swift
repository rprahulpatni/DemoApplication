//
//  APIManager.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 16/06/21.
//

import Foundation

class APIManager: NSObject {
    //MARK: ApiCall
    func dummyApiCall(callBack:@escaping (_ responseModel: ProductData?,_ error:String?,_ status:String) -> Void) {
        let queryItems = [URLQueryItem(name: "product_category_id", value: "1")]
        var urlComps = URLComponents(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList")!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
        
        var request = URLRequest(url: result)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductData.self, from: data!)
                callBack(responseModel,nil, "success")
            }catch(let errorUser){
                print("JSON Serialization error \(errorUser.localizedDescription)")
                callBack(nil,errorUser.localizedDescription, "fail")
            }
        }).resume()
    }
}
