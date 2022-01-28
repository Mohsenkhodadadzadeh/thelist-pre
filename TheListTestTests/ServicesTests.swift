//
//  ServicesTests.swift
//  TheListTestTests
//
//  Created by Mohsen on 1/28/22.
//

import XCTest
import UIKit
@testable import TheListTest

class ServicesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testResponse200() throws {
        
        
        let localObject: BaseModel<[BannerModel]> = BaseModel(status: 200, message: "", data: [BannerModel(id: 1, title: "banner 1", expensiveLevel: 2, imageAddressString: "https://www.i-swift.com/thelist/bar1.jpg")])
        
        let localData = """
{
    "status": 200,
    "message": "",
    "data": [
        {
            "id": 1,
            "title": "banner 1",
            "exp_level": 2,
            "image": "https://www.i-swift.com/thelist/bar1.jpg"
        }
    ]
}
"""
            .data(using: .ascii)
        
        
        
        var state200: NetworkChainProtocol = Response200()
        var state404: NetworkChainProtocol = NotResponse404()
        let state500: NetworkChainProtocol = ServerError500()
        
        
        state200.next = state404
        state404.next = state500
        
        let proccesdData: BaseModel<[BannerModel]> = try! state200.calculate(localData!, status: 200)
          //  XCTAssertTrue(proccesdData != nil)
            XCTAssertEqual(localObject, proccesdData)
        
    }
    
    func testChainNotResponse404() throws {
        
        let dummyData = "dummy".data(using: .ascii)
        var state200: NetworkChainProtocol = Response200()
        var state404: NetworkChainProtocol = NotResponse404()
        let state500: NetworkChainProtocol = ServerError500()
        
        
        state200.next = state404
        state404.next = state500
        
        do {
        let _: BaseModel<[BannerModel]> = try state200.calculate(dummyData!, status: 404)
            
        } catch let ex as NetworkErrors{
            XCTAssertEqual(ex.errorDescription, NetworkErrors.notFound.errorDescription)
        }
          //  XCTAssertTrue(proccesdData != nil)
        
    }
    
    func testServerError500() throws {
        
        let dummyData = "dummy".data(using: .ascii)
        var state200: NetworkChainProtocol = Response200()
        var state404: NetworkChainProtocol = NotResponse404()
        let state500: NetworkChainProtocol = ServerError500()
        
        
        state200.next = state404
        state404.next = state500
        
        do {
        let _: BaseModel<[BannerModel]> = try state200.calculate(dummyData!, status: 500)
            
        } catch let ex as NetworkErrors{
            XCTAssertEqual(ex.errorDescription, NetworkErrors.internalServerError.errorDescription)
        }
          //  XCTAssertTrue(proccesdData != nil)
       
    }

    func testEndOfChainWithUndefindedStatusCode() throws {
        
        let dummyData = "dummy".data(using: .ascii)
        var state200: NetworkChainProtocol = Response200()
        var state404: NetworkChainProtocol = NotResponse404()
        let state500: NetworkChainProtocol = ServerError500()
        
        
        state200.next = state404
        state404.next = state500
        
        do {
        let _: BaseModel<[BannerModel]> = try state200.calculate(dummyData!, status: 9545)
            
        } catch let ex as NetworkErrors{
            XCTAssertEqual(ex.errorDescription, NetworkErrors.endOfChain.errorDescription)
        }
          //  XCTAssertTrue(proccesdData != nil)
      
    }
    
    func testGettingDataWithAnyView() throws {
        
        
        let testView = TestView()
        let testObj = BannerRouter.start(testView)
        
        
        class TestView: AnyView {
            
            var presenter: AnyPresenter?
            let resultExpection = XCTestExpectation(description: "waiting for the result")
           
            func update<T>(with result: T) where T : Decodable, T : Encodable {
                print(result as? BaseModel<[BannerModel]>)
                resultExpection.fulfill()
                XCTAssertNotNil(result as? BaseModel<[BannerModel]>)
                
            }
            
            func update(with error: Error) {
                print(error.localizedDescription)
                resultExpection.fulfill()
                XCTAssertTrue(error is NetworkErrors)
            }
            
        }
        
        wait(for: [testView.resultExpection], timeout: 10)
        
    }
    
}
