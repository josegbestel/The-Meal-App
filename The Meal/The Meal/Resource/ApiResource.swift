//
//  ApiResource.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation

class ApiResource{
    
    static func request(method :String, url :String, params :[String : Any]?, body :[String : Any]?, completion: @escaping (Any?, Error?) -> Void){
        
        //Create URL
        guard let URL = URL(string: url) else{
            completion(nil, nil)
            return
        }
        
        let request = NSMutableURLRequest(url: URL)
        request.httpMethod = method.uppercased()
        
        //If exists params
        if params != nil{
            //Turn dict into rest params
            let reqParams = params!.map{ "\($0.0)=\($0.1)" }.joined(separator: "&")
            request.url = Foundation.URL(string: "\(request)?\(reqParams)")
            print("Request URL: \(request)?\(reqParams)")
        }
        
        //If exists body
        if body != nil{
            //Turn dict into json
            if let bodyJson = try? JSONSerialization.data(withJSONObject: body, options: []){
                let bodyTxt = String(data: bodyJson, encoding: .ascii)
                request.httpBody = bodyTxt?.data(using: String.Encoding.utf8)
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
                print("Request Body: \(bodyTxt)")
            }
        }
        
        //Create async task requisition
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            do{
                if let httpResponse = response as? HTTPURLResponse{
                    print("Response statusCode: \(httpResponse.statusCode)")
                    if(httpResponse.statusCode <= 200 || httpResponse.statusCode >= 299){
                        print("Response error: \(error)")
                        completion(nil, error)
                    }
                }
                
                if let data = data{
                    print("Response with content")
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response, nil)
                }else{
                    print("Response without content")
                    completion(nil, nil)
                }
            }catch let error as NSError{
                print("Error in request: \(error)")
                completion(nil, error)
            }
        }
        task.resume()
        
        
    }
}
