//
//  InstructionsViewType.swift
//  
//
//  Created by Muhand Jumah on 4/26/23.
//

public enum InstructionsViewType {
    case simple(instructions: [String], position: InstructionsViewPosition = .below)
    case custom(view: (_ advance: @escaping () -> (), _ previous: @escaping () -> ()) -> InstructionsView)

    internal func body(
        currentIndex: Binding<Int>,
        maxCount: Int,
        advance: @escaping () -> (),
        previous: @escaping () -> ()
    ) -> InstructionsView {
        switch self {
        case .simple(let instructions, let position):
            return SimpleInstructionsViewWrapper(currentGlobalIndex: currentIndex,
                                                 globalMaxCount: maxCount,
                                                 advance: advance,
                                                 previous: previous,
                                                 instructions: instructions)
            .convertToInstructionsView(position: position)
        case .custom(let view):
            return view(advance, previous)
        }
    }
}

// TODO: Rework this piece
import SwiftUI

internal struct SimpleInstructionsViewWrapper: View {
    // Global instructions
    @Binding var currentGlobalIndex: Int
    var globalMaxCount: Int
    let advance: () -> ()
    let previous: () -> ()

    private(set) var instructions: [String]
    @State private var currentInstructionIndex: Int = 0
    @State private var showPrevious: Bool = false
    @State private var showNext: Bool = false

    var body: some View {
        SimpleInstructionsView(
            text: self.instructions[self.currentInstructionIndex],
            showPrevious: .init (
                get: {
                    return (self.currentGlobalIndex > 0 && self.globalMaxCount > 0) || (self.currentInstructionIndex > 0 && self.instructions.count > 0)
                },
                set: { _ in}
            ),
            showNext: .init(
                get: {
                    return self.currentInstructionIndex < instructions.count - 1 || self.currentGlobalIndex < self.globalMaxCount - 1
                },
                set: { _ in }
            )
        )
        .onTapNext {
            guard currentInstructionIndex == instructions.count - 1 else {
                currentInstructionIndex += 1
                return
            }

            advance()
            self.currentInstructionIndex = 0
        }
        .onTapPrev {
            guard currentInstructionIndex == 0 else {
                currentInstructionIndex -= 1
                return
            }
//            guard self.currentInstructionIndex > 0 else {
//                return
//            }
//            self.currentInstructionIndex -= 1
            self.currentInstructionIndex = 0
            previous()
//            self.currentInstructionIndex = instructions.count

        }
        .overlay(
            VStack {
                Text("\(self.globalMaxCount)")
                Text("\(self.currentGlobalIndex)")
                Text("\(self.instructions.count)")
                Text("\(self.currentInstructionIndex)")
            }
                .offset(x: 0, y: 100)
        )
        .padding(.horizontal, 15)
//        .onChange(of: self.currentInstructionIndex, perform: { newValue in
//            // For the next button
//            if(newValue < instructions.count - 1 || currentGlobalIndex < globalMaxCount - 1) {
//                self.showNext = true
//            } else {
//                self.showNext = false
//            }
//
//            if(newValue > 0 && self.instructions.count > 0) {
//                self.showPrevious = true
//            } else {
//                self.showPrevious = false
//            }
//        })
        .onAppear {
            // Next
            if(currentInstructionIndex < instructions.count - 1 || currentGlobalIndex < globalMaxCount) {
                self.showNext = true
            } else {
                self.showNext = false
            }
//            if(currentInstructionIndex < instructions.count - 1) {
//                self.showNext = true
//            } else {
//                self.showNext = false
//            }
//
            if(currentInstructionIndex > 0 && self.instructions.count > 0) {
                self.showPrevious = true
            } else {
                self.showPrevious = false
            }
        }
    }
}

//struct SimpleInstructionsViewWrapper_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleInstructionsViewWrapper(instructions: ["Hello", "World", "askdlfjalk shfjlka dhfkj ahsdfkhdj"])
//    }
//}
