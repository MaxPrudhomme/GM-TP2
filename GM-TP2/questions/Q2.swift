//
//  Q2.swift
//  GM-TP2
//
//  Created by Max PRUDHOMME on 03/11/2025.
//

import simd
import SwiftUI
import SceneKit

func Q2(meshName: String) -> SCNNode {
    let mesh = Mesh()
    try! mesh.load(named: meshName)
    
    mesh.center()
    
    return mesh.makeNode()
}
