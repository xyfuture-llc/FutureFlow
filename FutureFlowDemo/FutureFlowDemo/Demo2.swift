//
//  Demo2.swift
//  FutureFlowDemo
//
//  Created by Muhand Jumah on 4/22/23.
//

import SwiftUI

struct User: Identifiable, Equatable {
    let id: UUID = UUID()
    let name: String
    var message: String = ""
}

var users: [User] = [
    .init(name: "Muhand", message: "This is just a test message, akjsdfh al ladsjf l;aksdj fl;ksajf;lasdfkfjksjfh"),
    .init(name: "Hussam"),
    .init(name: "Jareny"),
    .init(name: "Mays"),
    .init(name: "Nahla"),
    .init(name: "Abbas"),
    .init(name: "Jumah"),
    .init(name: "Mathry"),
    .init(name: "Katie"),
    .init(name: "Valeria"),
    .init(name: "Johanna")
]

struct DemoRoot: View {
    enum DemoRootViews {
        case Demo2
        case Demo3
    }

    @Namespace private var rootNamespace
    @Namespace private var namespace
    @State private var currentDemoView: DemoRootViews = .Demo2

    var body: some View {
        VStack {
//            Button(action: {
////                .onTapGesture {
//                    self.currentDemoView = .Demo3
////                }
//            }) {
//                Text("SWITCH")
//            }
            switch self.currentDemoView {
            case .Demo2:
                VStack {
                    HStack {
                        Demo2(namespace: self.namespace)
                        //                    .matchedGeometryEffect(id: 0, in: self.rootNamespace)
                            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.7)
                            .padding(.horizontal, 15)
                            .onTapGesture {
                                self.switchViews()
                            }

                        Spacer()
                    }

                    Spacer()
                }
            case .Demo3:
                Demo3(namespace: self.namespace)
//                    .matchedGeometryEffect(id: 0, in: self.rootNamespace)
                    .onTapGesture {
                        self.switchViews()
                    }
            }
        }
    }

    func switchViews() {
        withAnimation(.spring()) {
            switch self.currentDemoView {
                case .Demo2:
                    self.currentDemoView = .Demo3
                case .Demo3:
                    self.currentDemoView = .Demo2
            }
        }
    }
}

struct Demo2: View {
    var namespace: Namespace.ID

    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            HStack(alignment:.center, spacing: 5) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing:0) {
                        ForEach(users, id:\.id) { user in
                            if
                                let last = users.last,
                                user == last {
                                Text("\(user.name)")
                                    .matchedGeometryEffect(id: "\(user.id)_name", in: self.namespace)
                            } else {
                                Text("\(user.name), ")
                                    .matchedGeometryEffect(id: "\(user.id)_name", in: self.namespace)
                            }
                        }
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment:.top, spacing:5) {
                        ForEach(users, id:\.id) { user in
                            ZStack {
                                Circle()
                                    .matchedGeometryEffect(id: "\(user.id)_profile_image", in: self.namespace)
                                    .frame(width: 32, height: 32, alignment: .center)

                                Text("\(String(user.name.prefix(1)))")
                                    .foregroundColor(Color.white)
                                    .matchedGeometryEffect(id: "\(user.id)_letter", in: self.namespace)
                            }
                        }
                    }
                }
                .zIndex(500)
            }

            Divider()
                .matchedGeometryEffect(id: "divider", in: self.namespace)

            HStack(alignment:.top, spacing:0) {
                Text(users[0].message)
                    .matchedGeometryEffect(id: "\(users[0].id)_msg", in: self.namespace)
                    .lineLimit(1)

                Spacer()

                Text("10:51 pm")
                    .matchedGeometryEffect(id: "\(users[0].id)_msg_time", in: self.namespace)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1),
            alignment: .center
        )
    }
}

struct Demo3: View {
    var namespace: Namespace.ID
    var body: some View {
        VStack(spacing:0) {
            Spacer()

            VStack(spacing:0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(users, id:\.id) { user in
                            VStack(spacing:5) {
                                ZStack {
                                    Circle()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "\(user.id)_profile_image", in: self.namespace)
                                        .frame(width: 64, height: 64)

                                    Text("\(String(user.name.prefix(1)))")
                                        .foregroundColor(Color.white)
                                        .matchedGeometryEffect(id: "\(user.id)_letter", in: self.namespace)
                                }

                                Text(user.name)
                                    .matchedGeometryEffect(id: "\(user.id)_name", in: self.namespace)
                            }
                        }
                    }
                }.zIndex(500) // end of scrollview

                Divider()
                    .matchedGeometryEffect(id: "divider", in: self.namespace)

                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment:.leading, spacing:0) {
                        VStack(alignment: .leading, spacing:5) {
                            HStack(spacing:5) {
                                Circle()
                                    .matchedGeometryEffect(id: "\(users[0].id)_profile_image", in: self.namespace)
                                    .frame(width: 24, height: 24)

                                Text("\(users[0].name)")
                                    .matchedGeometryEffect(id: "\(users[0].id)_name", in: self.namespace)

                                Spacer()

                                Text("10:51 pm")
                                    .matchedGeometryEffect(id: "\(users[0].id)_msg_time", in: self.namespace)
                            }

                            Divider()

                            Text("\(users[0].message)")
                                .matchedGeometryEffect(id: "\(users[0].id)_msg", in: self.namespace)
                        }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .frame(
                                maxWidth: .infinity,
                                minHeight: 100,
                                maxHeight: 100,
                                alignment: .topLeading
                            )
                            .background(Color.white)
                            .cornerRadius(15)
                    }
                    .rotationEffect(.degrees(-180))
                }
                .rotationEffect(.degrees(-180))
                .padding(.horizontal, 15)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 300,
                    idealHeight: 300,
                    maxHeight: 300,
                    alignment:.topLeading
                )
                .background(Color.green)
                .padding(.horizontal, -15)
            }
            .padding(.horizontal, 15) // end of vstack
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .top)
        .background(Color.red)
    }
}

struct Demo2_Previews: PreviewProvider {
    static var previews: some View {
        let prevNamespcae: Namespace.ID = Namespace().wrappedValue
        Group {
            DemoRoot()
                .previewDisplayName("DemoRoot")

            Demo2(namespace: prevNamespcae)
                .padding()
                .previewDisplayName("Demo2")

            Demo3(namespace: prevNamespcae)
                .previewDisplayName("Demo3")
        }
    }
}
