//
//  Demo3.swift
//  FutureFlowDemo
//
//  Created by Muhand Jumah on 4/22/23.
//

import SwiftUI

struct Demo10: View {
    enum Highlight: Identifiable {
        case first
        case second
        case third

        var id: Int {
            self.hashValue
        }
    }
    @State private var sw: Bool = false
    @State private var currentHighlight: Highlight = .first

    @Namespace private var namespace

    var body: some View {
        VStack {
            ZStack {
                VStack(spacing:50) {
                    //            if(!sw) {
                    Rectangle()
                        .fill(.red)
                        .matchedGeometryEffect(id: Highlight.first.id,
                                               in: namespace,
                                               properties: .frame,
                                               anchor: .center,
                                               isSource: true)
                        .frame(width: 100, height: 200)

                    Rectangle()
                        .fill(.orange)
                        .matchedGeometryEffect(id: Highlight.second.id,
                                               in: namespace,
                                               properties: .frame,
                                               anchor: .center,
                                               isSource: true)
                        .frame(width: 50, height: 50)


                    Circle()
                        .fill(.black)
                        .matchedGeometryEffect(id: Highlight.third.id,
                                               in: namespace,
                                               properties: .frame,
                                               anchor: .center,
                                               isSource: true)
                        .frame(width: 200, height: 200)
                }
            }

            // Spotlight goes here

            self.currentHighlight.shape(self.namespace)
                .matchedGeometryEffect(id: self.currentHighlight.id,
                                       in: namespace,
                                       properties: .frame,
                                       anchor: .center,
                                       isSource: false)


        }
        .onTapGesture {
            withAnimation {
                if(self.currentHighlight == .first) {
                    self.currentHighlight = .second
                } else if (self.currentHighlight == .second){
                    self.currentHighlight = .third
                } else {
                    self.currentHighlight = .first
                }
            }
        }
    }
}

struct Demo10_Previews: PreviewProvider {
    static var previews: some View {
        Demo10()
    }
}

extension Demo10.Highlight {
    func shape(_ ns: Namespace.ID) -> some View {
        ZStack {
            switch self {

            case .first:
                Rectangle()
                    .foregroundColor(.purple)
                    .matchedGeometryEffect(id: 998, in: ns)

            case .second:

                Rectangle()
                    .foregroundColor(.purple)
                    .matchedGeometryEffect(id: 998, in: ns)

            case .third:
                Circle()
                    .foregroundColor(.purple)
                    .matchedGeometryEffect(id: 998, in: ns)

            }
        }
    }
}


//import SwiftUI
//
//struct Demo10: View {
//    enum TestEnum {
//        case first
//        case second
//
//        func shape(ns: Namespace.ID) -> some View {
//            ZStack {
//                switch self {
//                case .first:
//                    Rectangle()
//                        .foregroundColor(.purple)
//                        .matchedGeometryEffect(id: 0, in: ns)
//                        .frame(width: 100, height: 100)
//
//                case .second:
//                    Circle()
//                        .foregroundColor(.red)
//                        .matchedGeometryEffect(id: 0, in: ns)
//                        .frame(width: 300, height: 300)
//                }
//            }
//        }
//    }
//
//    @Namespace private var ns
//
//    @State private var currentShape:TestEnum = .first
//    @State private var sw: Bool = false
//
//    var body: some View {
//        VStack {
//            VStack(spacing: 0) {
//                Button(action: {
//                    withAnimation {
//                        if(self.currentShape == .first) {
//                            self.currentShape = .second
//                        } else {
//                            self.currentShape = .first
//                        }
//                    }
//                }) {
//                    Text("Switch")
//                }
//                .frame(height: 50)
//
//                self.currentShape.shape(ns: self.ns)
//            }
//            .frame(maxWidth: 300, maxHeight: 350, alignment: .center)
//            .border(Color.blue, width: 2)
//
//            Divider()
//
//            VStack(spacing: 0) {
//                Button(action: {
//                    withAnimation {
//                        self.sw.toggle()
//                    }
//                }) {
//                    Text("Switch")
//                }
//                .frame(height: 50)
//
//                if(!self.sw) {
//                    Rectangle()
//                        .foregroundColor(.purple)
//                        .frame(width: 100, height: 100)
//                } else {
//                    Circle()
//                        .foregroundColor(.red)
//                        .frame(width: 300, height: 300)
//                }
//            }
//            .frame(maxWidth: 300, maxHeight: 350, alignment: .center)
//            .border(Color.green, width: 2)
//        }
//    }
//}
//
//struct Demo10_Previews: PreviewProvider {
//    static var previews: some View {
//        Demo10()
//    }
//}
