//
//  JSONError.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 27.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

// just description of type errors
enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}
