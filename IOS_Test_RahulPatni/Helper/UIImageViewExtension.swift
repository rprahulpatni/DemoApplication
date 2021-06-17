//
//  UIImageViewExtension.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import Foundation
import UIKit

let imgCache = NSCache<NSString, AnyObject>()

//For image Downloading and Caching
extension UIImageView {
    
    // public var isContentInset: Bool = false
    
    public func setImageFromURl(_ urlString: String) {
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        let size = self.frame.size;
        activityIndicator.frame = CGRect.init(x: 0.0, y: 0.0, width: 44, height: 44)
        activityIndicator.startAnimating()
        // add spinner when image not avaialble
        if self.image == nil{
            activityIndicator.center = CGPoint(x: (size.width/2), y: (size.height/2)); // set center spinner
            self.addSubview(activityIndicator) // add spinner
        }else{
            
        }
        // check cached image
        if let cachedImage = imgCache.object(forKey: urlString as NSString) as? UIImage {
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.fade
            
            self.image = cachedImage
            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview() // removed spinner when image loaded
            }
            return
        }
        // loading image by URL
        let encodeUrl: String? = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        URLSession.shared.dataTask(with: URL(string: encodeUrl!)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                DispatchQueue.main.async {
                    activityIndicator.removeFromSuperview() // removed spinner when image loaded
                }
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    activityIndicator.removeFromSuperview() // removed spinner when image loaded
                }
                
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = CATransitionType.fade
                
                if image != nil {
                    self.image = image
                    imgCache.setObject(image!, forKey: urlString as NSString)
                }
            })
            
        }).resume()
    }
}
