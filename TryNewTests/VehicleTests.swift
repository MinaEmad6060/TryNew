//
//  VehicleTests.swift
//  TryNewTests
//
//  Created by Mina Emad on 24/09/2025.
//

import XCTest
@testable import TryNew

final class VehicleTests: XCTestCase {
    var mercedes: Vehicle!
    var boeing: Vehicle!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mercedes = Vehicle(type: .Car)
        boeing = Vehicle(type: .PassengerAircraft)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mercedes = nil
        boeing = nil
    }

    func testPlaneFasterThanCar() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        //Act
                let minutes = 60
                
                //Arrenge
                mercedes.startEngine(minutes: minutes)
                boeing.startEngine(minutes: minutes)
                
                //Assert
                XCTAssertTrue(boeing.returnMiles() > mercedes.returnMiles())
    }
    
    func testFetchPostList() {
        let exp = expectation(description:"fetching post list from server")
        let session: URLSession = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        guard let customUrl = url else { return }
        
        session.dataTask(with: customUrl) { data, response, error in
            XCTAssertNotNil(data)
            exp.fulfill()
        }.resume()
        waitForExpectations(timeout: 5.0) { (error) in
            print(error?.localizedDescription ?? "error")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
