//
//  Closures.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

public typealias Action = (() -> Void)
public typealias ActionWith<ParamType> = ((ParamType) -> Void)
public typealias Function<ReturnType> = (() -> ReturnType)
public typealias FunctionWith<ParamType, ReturnType> = ((ParamType) -> ReturnType)
