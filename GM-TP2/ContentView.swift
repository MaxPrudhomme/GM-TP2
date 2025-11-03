//
//  ContentView.swift
//  GM-TP2
//
//  Created by Max PRUDHOMME on 03/11/2025.
//

import SwiftUI
import SceneKit

enum Question: String, CaseIterable, Identifiable {
    case q1 = "Q1"
    case q2 = "Q2"
    case q3 = "Q3"
    var id: String { rawValue }
}

struct ContentView: View {
    @State private var selectedQuestion: Question = .q3
    @State private var selectedMesh: String = "cube"

    private let availableMeshes: [String] = ["cube", "plan", "bunny", "buddha"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Controls
            HStack {
                Picker("Question", selection: $selectedQuestion) {
                    ForEach(Question.allCases) { q in
                        Text(q.rawValue).tag(q)
                    }
                }
                .pickerStyle(.segmented)

                Spacer()
                
                Picker("Mesh", selection: $selectedMesh) {
                    ForEach(availableMeshes, id: \.self) { mesh in
                        Text(mesh.capitalized).tag(mesh)
                    }
                }
                .pickerStyle(.menu)
            }
            .padding(.horizontal)

            // Preview
            GeometryPreview {
                switch selectedQuestion {
                case .q1:
                    Q1(meshName: selectedMesh)
                case .q2:
                    Q2(meshName: selectedMesh)
                case .q3:
                    Q3(meshName: selectedMesh)
                }
            }
            .id(selectedQuestion.rawValue + "-" + selectedMesh)
            .frame(minHeight: 300)
        }
    }
}

#Preview {
    ContentView()
}
