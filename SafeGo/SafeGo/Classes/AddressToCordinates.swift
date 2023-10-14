//
//  AddressToCordinates.swift
//  SafeGo
//
//  Created by Gabriela on 10/13/23.
//

import Foundation
import CoreLocation

class GeocodingService {
    func geocodeAddress(address: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let placemark = placemarks?.first {
                completion(placemark.location?.coordinate, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}
