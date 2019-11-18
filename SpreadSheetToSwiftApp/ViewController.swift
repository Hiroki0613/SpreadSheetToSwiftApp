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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var spreadSheetTableView: UITableView!
    
    var ID_Array = [String]()
    var name_Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        spreadSheetTableView.delegate = self
        spreadSheetTableView.dataSource = self
        
        getData()
    }

     // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = spreadSheetTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellID = cell.viewWithTag(1) as! UILabel
        cellID.text = ID_Array[indexPath.row]
        
        let cellName = cell.viewWithTag(2) as! UILabel
        cellName.text = name_Array[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    // MARK: - API通信
    func getData(){
        
        //非同期処理開始
        DispatchQueue.global().async {
            
            //同期処理開始
            DispatchQueue.main.async {
                
                let url = "https://script.googleusercontent.com/macros/echo?user_content_key=oQatZCIiRtyN8zRbYNETqdtWzaVdxQ8Q4GzEguOkme0mWqTpzpZENZ5dov-5xYf_jvcyKKES-2525T6XGrI7BgYwpFZjZZQUm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLB_e7VVX3kcOGALXEI7BCPwlVjsy1Wpw0pLEpxgFh9MehdypQ3WWIVFghBl97br2w&lib=MYmh94ByISnwLCOaItycI2hSBcQ8BraCT"
                       
                //Alamofireを使ってhttpsリクエスト
                Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                           
                    //responceをswith文で分岐する
                    switch response.result{
                    case .success:
                        
                        //swiftyJSONを使って、JSON解析
                        for i in 0...19{
                            let json:JSON = JSON(response .data as Any)
                            let ID_String = json["jsondata"][i]["id"].string
                            let Name_String = json["jsondata"][i]["name"].string
                            
                            self.ID_Array.append(ID_String!)
                            self.name_Array.append(Name_String!)
                                   
                            print("hirohiro1")
                            print(self.ID_Array)
                            print("hirohiro2")
                            print(self.name_Array)
                            
                        }
                        
                    case .failure(let error):
                        print(error)
            
                    }
                    
                }
            
            }
            //同期処理終了
        
        }
        //非同期処理終了
        
    }
    
    
    
    
    /*
     参考にしたURL
     Googleスプレッドシートの内容をjsonデータとして利用する
     https://www.koreyome.com/web/make-spreadsheet-to-json-at-google-apps-script/
     */

}

