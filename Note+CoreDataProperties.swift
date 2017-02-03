//
//  Note+CoreDataProperties.swift
//  SimpleNotes
//
//  Created by Ronald Hernandez on 2/3/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var date: Date?

}
