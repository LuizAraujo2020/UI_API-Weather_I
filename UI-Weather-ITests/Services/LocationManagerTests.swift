//
//  LocationManagerTests.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 14/01/23.
//

import XCTest
import CoreLocation
import CoreLocationUI
@testable import UI_Weather_I

final class LocationManagerTests: XCTestCase {
    var sut: LocationManager!

    override func setUpWithError() throws {
        sut = LocationManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInit() {
        XCTAssertNotNil(sut.manager.delegate, "After the initialization, the `manager.delegate`shouldn't be nil.")
        XCTAssertNil(sut.location, "Right after the initialization, the `location` should be nil.")
    }
    
    func testRequestLocation() {
        /// When
        sut.requestLocation()
        
        /// Then
        
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
//        // THEN
//        if result == XCTWaiter.Result.timedOut {
//            XCTAssertNotNil(sut.location, "After the request, the `location` shouldn't be nil.")
//        } else {
//            XCTFail("Delay interrupted")
//        }
        
        
        
        
//        XCTAssertEqual(sut.location!.latitude, CLLocationDegrees(14.231213))
//
//        XCTAssertEqual(sut.location!.longitude, CLLocationDegrees(14.231213))
    }
    
    func test() {
        
    }
}
