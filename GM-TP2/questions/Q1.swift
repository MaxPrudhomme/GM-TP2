//
//  Q1.swift
//  GM-TP2
//
//  Created by Max PRUDHOMME on 03/11/2025.
//

import simd
import SwiftUI
import SceneKit

func Q1() -> SCNNode {
    let mesh = Mesh()
    try! mesh.load(named: "cube")
    
    return mesh.makeNode()
}
