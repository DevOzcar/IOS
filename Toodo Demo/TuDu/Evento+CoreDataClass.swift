//
//  Evento+CoreDataClass.swift
//  TuDu
//
//  Created by Oscar Borden on 13/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import Foundation
import CoreData
import SwiftRecord

@objc(Evento)
public class Evento: NSManagedObject {
    @NSManaged public var name: String?
    @NSManaged public var when: NSDate?
}
