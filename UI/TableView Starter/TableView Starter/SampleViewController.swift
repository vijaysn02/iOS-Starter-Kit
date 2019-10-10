//
//  SampleViewController.swift
//  TableView Starter
//
//  Created by Digital Testing on 08/10/19.
//  Copyright © 2019 VIjay. All rights reserved.
//

import Foundation
import UIKit

class SampleViewController : UIViewController {
    
    let serviceInteraction = ServiceInteraction()
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImageorVideo()
    }
    
}


extension SampleViewController {
    func uploadImageorVideo() {
        
        let urlString = "http://3.13.98.54:3090/uploads3"
        let sampleImage = UIImage(named: "avatar_1")
        guard let imageData = sampleImage?.pngData() else {
            return
        }
        
        serviceInteraction.uploadVideoasPOST(urlStringValue: urlString, fileData: imageData) { (responseData) in
            do {
                let postResponse = try JSONDecoder().decode(FileUploadResponse.self, from: responseData)
                print("Successful")
            } catch let jsonResponseError {
                print(jsonResponseError.localizedDescription)
            }
        }
    }
}


class ServiceInteraction {
    
    func uploadVideo(urlStringValue:String,fileData:Data,completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        let urlString = URL(string: urlStringValue)
        
        var request = URLRequest(url: urlString!)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.uploadTask(with: request, from: fileData, completionHandler: { data, response, error -> Void in
            
            guard let data = data else {
                return
            }
            completionBlock(data)
        })
        task.resume()
    }
    func uploadVideoasPOST(urlStringValue:String,fileData:Data,completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        let urlString = URL(string: urlStringValue)
        
        var request = URLRequest(url: urlString!)
        request.httpMethod = "POST"
        
        let parameters:Dictionary<String,Any> = ["file":fileData]
        let parameterData:Data = NSKeyedArchiver.archivedData(withRootObject: parameters)

        //request.httpBody = parameterData
        //request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.uploadTask(with: request, from: parameterData, completionHandler: { data, response, error -> Void in
            
            guard let data = data else {
                return
            }
            
            completionBlock(data)
            
        })
        task.resume()
    }
//    func uploadVideo(urlStringValue:String,fileData:Data,completionBlock: @escaping (Data) -> Void) -> Void
//    {
//
//        let urlString = URL(string: urlStringValue)
//
//        var request = URLRequest(url: urlString!)
//        request.httpMethod = "POST"
//
//        request.httpBody = {"file":fileData}
//
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        let session = URLSession.shared
//
//
//
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//
//
//            guard let data = data else {
//                return
//            }
//
//
//            completionBlock(data)
//        })
//        task.resume()
//    }
}





// MARK: - FileUploadResponse
struct FileUploadResponse: Codable {
    let status: Bool
    let data: UploadResponse
}

// MARK: - DataClass
struct UploadResponse: Codable {
    let eTag: String
    let location: String
    let dataKey, key, bucket: String
    
    enum CodingKeys: String, CodingKey {
        case eTag = "ETag"
        case location = "Location"
        case dataKey = "key"
        case key = "Key"
        case bucket = "Bucket"
    }
}
