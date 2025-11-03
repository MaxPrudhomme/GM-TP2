//
//  Q3.swift
//  GM-TP2
//
//  Created by Max PRUDHOMME on 03/11/2025.
//

import simd
import SwiftUI
import SceneKit

func Q3(meshName: String) -> SCNNode {
    let mesh = Mesh()
    try! mesh.load(named: meshName)
    
    mesh.center()
    mesh.normalize()
    
    return mesh.makeNode()
}
