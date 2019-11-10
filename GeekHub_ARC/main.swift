//
//  main.swift
//  GeekHub_ARC
//
//  Created by Mr Jake on 11/3/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import Foundation

class Container {
    weak var info: Box?
    deinit {
        print("Container clear")
    }
}

class Label {
    var text: Container?
    deinit {
        print("Label clear")
    }
}

class Box {
    var contane = 10
    var store: Label?
    deinit {
        print("Box clear")
    }
}

var bucket: Box? = Box()
bucket?.contane = 10

bucket = nil

var exel: Container? = Container()
var mark: Label? = Label()
var bigBox: Box? = Box()
exel?.info = bigBox
bigBox?.store = mark
mark?.text = exel

exel = nil
bigBox = nil
mark = nil
