//
//  Classes+CoreDataProperties.swift
//  E-SchoolAttendence
//
//  Created by Pavan Kalyan Jonnadula on 04/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//
//

import Foundation
import CoreData


extension Classes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Classes> {
        return NSFetchRequest<Classes>(entityName: "Classes")
    }

    @NSManaged public var classname: String?
    @NSManaged public var numberstudents: Int16

}
