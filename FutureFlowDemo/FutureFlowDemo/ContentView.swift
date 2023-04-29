//
//  ContentView.swift
//  FutureFlowDemo
//
//  Created by Muhand Jumah on 4/21/23.
//

import SwiftUI
import FutureFlow

struct ParentWrapper: InstructionsView {
    @Binding var tutorial: TutorialChunks
    let next: () -> ()
    let back: () -> ()
    
    @State private var instructions: [String] = []
    @Namespace var ns
    
    var body: some View {
        RectanglesTutorial(instructions: self.$instructions)
            .onDone({ withNext in
                if(withNext) {
                    self.next()
                } else {
                    self.back()
                }
            })
            .animation(.easeOut, value: self.tutorial)
            .onAppear {
                switch self.tutorial {
                case .red1:
                    self.instructions = ["This is red"]
                    break
                case .red2:
                    self.instructions = ["Red is purple now??? WHAT?"]
                    break
                case .red3:
                    self.instructions = ["No way, IT IS BLUE!!"]
                    break
                case .yellow:
                    self.instructions = ["This is yellow"]
                    break
                case .green:
                    self.instructions = ["This is green"]
                    break
                }
                
            }
            .onChange(of: self.tutorial) { newValue in
                switch newValue {
                case .red1:
                    self.instructions = ["This is red"]
                    break
                case .red2:
                    self.instructions = ["Red is purple now??? WHAT?"]
                    break
                case .red3:
                    self.instructions = ["No way, IT IS BLUE!!"]
                    break
                case .yellow:
                    self.instructions = ["This is yellow"]
                    break
                case .green:
                    self.instructions = ["This is green"]
                    break
                }
            }
    }
}

enum TutorialChunks: FlowChunk, CaseIterable {
    case red1
    case red2
    case red3
    case green
    case yellow
    
    var spotlightShape: SpotlightShape {
        switch self {
        case .yellow:
            return .circle()
        default:
            return .rectangle()
        }
    }
    
    var spotlightBackground: SpotlightBackground {
        switch self {
        case .green:
            return .ultraThinMaterial
        default:
            return .black
        }
    }
    
    var instructionsViewPosition: InstructionsViewPosition {
        switch self {
        case .red1, .red2, .red3:
            return .below
        case .green:
            return .above
        case .yellow:
            return .above
        }
    }
    
    func instructionsView(_ next: @escaping () -> (), _ back: @escaping () -> ()) -> FutureFlow.AnyInstructionsView? {
        switch self {
        case .red1, .red2:
            ParentWrapper(tutorial:
                    .init(
                        get: {
                            self
                            
                        }, set: { _ in }
                    ),
                          next: next,
                          back: back
            )
        default:
            ParentWrapper(tutorial:
                    .init(
                        get: {
                            self
                            
                        }, set: { _ in }
                    ),
                          next: next,
                          back: back
            )
        }
    }
    
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .red1, .red2, .red3:
            hasher.combine(0)
        case .green:
            hasher.combine(1)
        case .yellow:
            hasher.combine(2)
        }
    }
}


struct ContentView: View {
    @State private var rectColor: Color = .red
    private var uniqueIdentifier: String = UUID().uuidString
    
    @State private var showTutorial: Bool = true
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 256, height: 256, alignment: .center)
                .foregroundColor(self.rectColor)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.red1
                )
            
            Rectangle()
                .frame(width: 64, height: 128, alignment: .center)
                .foregroundColor(Color.green)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.green
                )
            
            Circle()
                .frame(width: 128, height: 128, alignment: .center)
                .foregroundColor(.yellow)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.yellow
                )
                .onTapGesture {
                    //                    withAnimation(.linear) {
                    self.showTutorial = true
                    //                    }
                }
        }
        .padding()
        .assembleSpotlightChunks(namespace:self.namespace, uniqueIdentifier: self.uniqueIdentifier, chunks: Array(TutorialChunks.allCases), showTutorial: self.$showTutorial) {
            chunk in
            withAnimation(.easeOut) {
                switch chunk {
                case .red2:
                    self.rectColor = .purple
                    break
                case .red3:
                    self.rectColor = .blue
                    break
                default:
                    self.rectColor = .red
                    break
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


internal struct RectanglesTutorial: InstructionsView {
    @Binding private var instructions: [String]
    
    @Namespace var positionNamespace
    private var positionId: String = "steps-position-id"
    @State private var showNext: Bool = true
    @State private var showPrevious: Bool = true
    @State private var currentStep: Int = 0
    
    private var onDone: ((_ withNext: Bool) -> ())?
    
    internal init(instructions: Binding<[String]>) {
        self._instructions = instructions
        //        self.onDone = { _ in }
        self.onDone = nil
    }
    
    fileprivate init(instructions: Binding<[String]>, onDone: @escaping (_ withNext: Bool) -> ()) {
        self._instructions = instructions
        self.onDone = onDone
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: "lightbulb.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.blue)
                if(self.currentStep < self.instructions.count) {
                    Text(self.instructions[self.currentStep])
                        .font(.body)
                        .animation(.easeOut, value: self.currentStep)
                }
            }
            .matchedGeometryEffect(id: positionId, in: self.positionNamespace, properties: .position, anchor: .bottomTrailing, isSource: true)
            
            HStack(alignment: .center, spacing:15) {
                if(self.showPrevious) {
                    Button(action: {
                        guard self.currentStep > 0 else {
                            if let onDone = self.onDone {
                                onDone(false)
                            }
                            return
                        }
                        
                        self.currentStep -= 1
                    }) {
                        Text("Previous")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                    }
                }
                
                if(self.showNext) {
                    Button(action: {
                        guard self.currentStep < self.instructions.count - 1 else {
                            if let onDone = self.onDone {
                                onDone(true)
                            }
                            return
                        }
                        
                        self.currentStep += 1
                    }) {
                        Text("Next")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue)
                            .cornerRadius(3)
                            .foregroundColor(.white)
                    }
                }
            }
            .transition(.slide)
            .animation(.linear, value: self.showNext)
            .animation(.linear, value: self.showPrevious)
            .padding(.top, 10)
            .matchedGeometryEffect(id: positionId, in: self.positionNamespace, properties: .position, anchor: .topTrailing, isSource: false)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
        .animation(.easeOut, value: self.currentStep)
        .onAppear {
            self.currentStep = 0
        }
        .onChange(of: self.instructions) { newV in
            self.currentStep = 0
        }
    }
}

internal extension RectanglesTutorial {
    func onDone(_ callback: @escaping (_ withNext: Bool) -> ()) -> RectanglesTutorial {
        .init(instructions: self.$instructions, onDone: callback)
    }
}
