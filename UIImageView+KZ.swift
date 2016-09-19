//
//  KZUIImageView.swift
//  swift-handy
//
//  Created by katopz on 7/13/2558 BE.
//  Copyright © 2558 Debokeh. All rights reserved.
//

import Foundation
extension UIImageView {
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    public func imageFromUrl(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.sync() { () -> Void in
                guard let data = data, error == nil else { return }
                self.image = UIImage(data: data)
            }
        }
    }
    
    public func imageFromBundle(_ uriString: String) {
        self.image = UIImage(contentsOfFile: uriString)
    }
}
