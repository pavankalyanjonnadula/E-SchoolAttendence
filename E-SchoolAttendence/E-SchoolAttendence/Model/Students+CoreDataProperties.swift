//
//  Students+CoreDataProperties.swift
//  E-SchoolAttendence
//
//  Created by Pavan Kalyan Jonnadula on 04/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var attendence: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?

}
