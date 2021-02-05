//
//  AboutViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/4/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation

public class AboutViewModel {
    
    func milesSelected() -> Bool {
        switch Measures.preferred {
        case .miles:
            return true
        case .meters:
            return false
        }
    }
    
    func saveMeasurement(segment: Int) {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save currency anew if it doesn't exist (like on app initial launch)
        guard let currentMeasure = Measures.loaded else {
            let measureSave = Measurement(context: managedContext)
            
            switch segment {
            case 0:
                measureSave.selection = Distance.miles.rawValue
                Measures.preferred = .miles
            case 1:
                measureSave.selection = Distance.meters.rawValue
                Measures.preferred = .meters
            default:
                return
            }
            
            do {
                try managedContext.save()
                print("saved measurement")
            } catch {
                // this should never be displayed but is here to cover the possibility
                //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
            return
        }
        
        // otherwise rewrite data
        switch segment {
        case 0:
            currentMeasure.selection = Distance.miles.rawValue
            Measures.preferred = .miles
        case 1:
            currentMeasure.selection = Distance.meters.rawValue
            Measures.preferred = .meters
        default:
            return
        }
        
        do {
            try managedContext.save()
            print("resave of measure successful")
        } catch {
            // this should never be displayed but is here to cover the possibility
            //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
    }
}
