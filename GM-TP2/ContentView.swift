//
//  ContentView.swift
//  GM-TP2
//
//  Created by Max PRUDHOMME on 03/11/2025.
//

import SwiftUI
import SceneKit
import Combine

enum Question: String, CaseIterable, Identifiable {
    case q1 = "Q1"
    case q2 = "Q2"
    case q3 = "Q3"
    case q4 = "Q4"
    var id: String { rawValue }
}

struct ContentView: View {
    @State private var selectedQuestion: Question = .q4
    @State private var selectedMesh: String = "bunny"
    @State private var showWire: Bool = true

    private let availableMeshes: [String] = ["cube", "plan", "bunny", "buddha"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Controls
            HStack {
                Picker("", selection: $selectedQuestion) {
                    ForEach(Question.allCases) { q in
                        Text(q.rawValue).tag(q)
                    }
                }
                .pickerStyle(.segmented)

                Spacer()
                
                Picker("", selection: $selectedMesh) {
                    ForEach(availableMeshes, id: \.self) { mesh in
                        Text(mesh.capitalized).tag(mesh)
                    }
                }
                .pickerStyle(.menu)

                Divider()
                Toggle("Wire", isOn: $showWire)
                    .toggleStyle(.switch)
            }
            .padding(.horizontal)

            // Preview
            GeometryPreview(geometryBuilder: {
                switch selectedQuestion {
                case .q1:
                    Q1(meshName: selectedMesh)
                case .q2:
                    Q2(meshName: selectedMesh)
                case .q3:
                    Q3(meshName: selectedMesh)
                case .q4:
                    Q4(meshName: selectedMesh)
                }
            }, showWire: showWire)
            .frame(minHeight: 300)
        }
    }
}

#Preview {
    ContentView()
}
