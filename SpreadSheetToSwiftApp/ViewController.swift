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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,AppearTableViewDelegate {
    
    
    
    
    @IBOutlet weak var spreadSheetTableView: UITableView!
    
    var ID_Array = [String]()
    var name_Array = [String]()
    
    
    //APIが取得できたことを知らせるフラグ
    //プロトコルをつかって、tableViewをreloadさせる
    var APISuccess = false

    var appearTableView = AppearTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spreadSheetTableView.delegate = self
        spreadSheetTableView.dataSource = self
        
        getData()
        
        appearTableView.delegate = self
        
    }
    
    //プロトコルが発動する時に動くメソッド
    //ここでtableViewをreloadする。
    func reloadTableView() {
        self.spreadSheetTableView.reloadData()
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
                
//                let url = "https://script.google.com/macros/s/AKfycbxH8Ec89wktvxtwoMBTCvNXK1g5fcfiAbhZadXXscxd54Lt2Ng/exec"
                
//            let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetCopy.json"
                
//                let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetJSON.json"
                
//                let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetJSON2.json"
             
//                let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetJSON3.json"

                let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetJSON4.json"
                
//                let url = "http://jesuslovesjerusa.lolipop.jp/spreadSheetJSON5.json"

                //Alamofireを使ってhttpsリクエスト
                Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                           
                    print("hirohiroResponse")
                    print(response)
                    
                    //responceをswith文で分岐する
                    switch response.result{
                    case .success:
                        
                        //swiftyJSONを使って、JSON解析
                        for i in 0...19{
                            let json:JSON = JSON(response .data as Any)
                            
                            
                            let ID_String = json[i]["number"].string
                            let Name_String = json[i]["name"].string
                            
//                            let ID_String = json["class"][i]["number"].string
//                            let Name_String = json["class"][i]["name"].string
                            
                            self.ID_Array.append(ID_String!)
                            self.name_Array.append(Name_String!)
                                   
                            print("hirohiro1")
                            print(self.ID_Array)
                            print("hirohiro2")
                            print(self.name_Array)
                            
                        }
                        
                        //APIが取得できたフラグを立てる
                        self.APISuccess = true
                        self.appearTableView.tableviewReload(ataiIn: self.APISuccess)
                        
                    case .failure(let error):
                        print(error)
            
                    
                    }
                    
                }
                
                self.spreadSheetTableView.reloadData()
            
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

    /*
   今回は、出力したJSONファイルを修正してからサーバーにアップロード、技術的にまだまだです・・・。
     */
    
}

