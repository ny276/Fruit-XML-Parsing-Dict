//
//  ViewController.swift
//  Fruit XML Parsing Dict
//
//  Created by D7703_17 on 2018. 9. 19..
//  Copyright © 2018년 D7703_17. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

      // 딕셔너리의 배열 저장 : item의 배열
      var elements:[[String:String]] = []
      // 딕셔너리 : item
      var item:[String:String] = [:]
      
      var currentElement = ""
      let strURL = "http://api.androidhive.info/pizza/?format=xml"
      
      override func viewDidLoad() {
            super.viewDidLoad()
            
            if URL(string: strURL) != nil {
                  if let myParser = XMLParser(contentsOf: URL(string: strURL)!) {
                       myParser.delegate = self
                        if myParser.parse() {
                              print("파싱 성공")
                              print(elements)
                        } else {
                              print("파싱 실패")
                        }
                  }
            } else {
                  print("URL 오류 발생!")
            }
            
//            if let path = Bundle.main.url(forResource: "Fruit", withExtension: "xml") {
//                  if let myParser = XMLParser(contentsOf: path) {
//                        myParser.delegate = self
//                        if myParser.parse() {
//                            print("parse 성공")
//                        } else {
//                              print("파싱 오류2")
//                        }
//                  } else {
//                        print("파싱 오류1")
//                  }
//            } else {
//                  print("XML file 없음")
//            }
      }
      // XMLParser Delegate 메소드
      func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            currentElement = elementName
            print(elementName)
      }
      
      func parser(_ parser: XMLParser, foundCharacters string: String) {
            let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if !data.isEmpty {
                  item[currentElement] = data
                  print(item[currentElement])
            }
      }
      
      func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            if elementName == "item" {
                  elements.append(item)
            }
      }
}


