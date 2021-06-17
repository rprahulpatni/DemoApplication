//
//  Product.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import Foundation

struct ProductData : Codable {
    
    let data : [Product]?
    let status : Int?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Product].self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }
    
}


struct Product : Codable {
    
    var product_id : Int?
    var product_category_id : Int?
    var product_name : String?
    var product_producer : String?
    var product_description : String?
    var product_cost : Int?
    var product_rating : Int?
    var product_view_count : Int?
    var product_Image : String?
    
    enum CodingKeys: String, CodingKey {
        case product_id = "id"
        case product_category_id = "product_category_id"
        case product_name = "name"
        case product_producer = "producer"
        case product_description = "description"
        case product_cost = "cost"
        case product_rating = "rating"
        case product_view_count = "view_count"
        case product_Image = "product_images"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.product_id  = try! container.decodeIfPresent(Int.self, forKey: .product_id)
        self.product_category_id  = try! container.decodeIfPresent(Int.self, forKey: .product_category_id)
        self.product_cost  = try! container.decodeIfPresent(Int.self, forKey: .product_cost)
        self.product_rating  = try! container.decodeIfPresent(Int.self, forKey: .product_rating)
        self.product_view_count  = try! container.decodeIfPresent(Int.self, forKey: .product_view_count)
        self.product_name  = try! container.decodeIfPresent(String.self, forKey: .product_name)
        self.product_description  = try! container.decodeIfPresent(String.self, forKey: .product_description)
        self.product_Image  = try! container.decodeIfPresent(String.self, forKey: .product_Image)
        self.product_producer  = try! container.decodeIfPresent(String.self, forKey: .product_producer)
    }
}


