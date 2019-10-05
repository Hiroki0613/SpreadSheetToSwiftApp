//
//  ViewController.swift
//  SpreadSheetToSwiftApp
//
//  Created by 宏輝 on 05/10/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var ID_Array = [String]()
    var Name_Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }

     // MARK: - TableView
    
    
    // MARK: - API通信
    func getData(){
        
        let url = "https://script.googleusercontent.com/macros/echo?user_content_key=oQatZCIiRtyN8zRbYNETqdtWzaVdxQ8Q4GzEguOkme0mWqTpzpZENZ5dov-5xYf_jvcyKKES-2525T6XGrI7BgYwpFZjZZQUm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLB_e7VVX3kcOGALXEI7BCPwlVjsy1Wpw0pLEpxgFh9MehdypQ3WWIVFghBl97br2w&lib=MYmh94ByISnwLCOaItycI2hSBcQ8BraCT"
        
        //Alamofireを使ってhttpsリクエスト
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            //responceをswith文で分岐する
            switch response.result{
            case .success:
                //swiftyJSONを使って、JSON解析
                
                for i in 0...19{
                    let json:JSON = JSON(response .data as Any)
                    let ID_String = json["jsondata"]["id"][i].string
                    let Name_String = json["jsondata"]["name"][i].string
                    
                    self.ID_Array.append(ID_String!)
                    self.Name_Array.append(Name_String!)
                    
                    print("hirohiro1")
                    print(self.ID_Array)
                    print("hirohiro2")
                    print(self.Name_Array)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    
    /*
     参考にしたURL
     Googleスプレッドシートの内容をjsonデータとして利用する
     https://www.koreyome.com/web/make-spreadsheet-to-json-at-google-apps-script/
     */

}

