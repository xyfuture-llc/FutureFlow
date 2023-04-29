// TODO: Create a default view
////
////  SimpleInstructionsView.swift
////
////
////  Created by Muhand Jumah on 4/23/23.
////
//
//import SwiftUI
//
//struct SimpleInstructionsView: View {
//    private var text: String
//    private var nextTapped: () -> ()
//    private var prevTapped: () -> ()
//
//    @Binding var showPrevious: Bool
//    @Binding var showNext: Bool
//
//    public init(
//        text: String,
//        showPrevious: Binding<Bool> = .constant(false),
//        showNext: Binding<Bool> = .constant(false)
//    ) {
//        self.text = text
//        self.nextTapped = { }
//        self.prevTapped = { }
//        self._showPrevious = showPrevious
//        self._showNext = showNext
//    }
//
//    fileprivate init(
//        text: String,
//        nextTapped: @escaping () -> (),
//        prevTapped: @escaping () -> (),
//        showPrevious: Binding<Bool> = .constant(false),
//        showNext: Binding<Bool> = .constant(false)
//    ) {
//        self.text = text
//        self.nextTapped = nextTapped
//        self.prevTapped = prevTapped
//        self._showPrevious = showPrevious
//        self._showNext = showNext
//    }
//
//    var body: some View {
////        Color.purple
//        VStack(alignment:.leading, spacing: 20) {
//            HStack(alignment: .top, spacing: 10) {
//                Image(systemName: "lightbulb.circle.fill")
//                    .font(.system(size: 32))
//                    .foregroundColor(.blue)
//
//                Text(self.text)
//                    .font(.body)
//            }
//
//            if (self.showPrevious || self.showNext) {
//                HStack(alignment: .center, spacing:15) {
//                    Spacer()
//                    if(self.showPrevious) {
//                        Button(action: {
//                            self.prevTapped()
//                        }) {
//                            Text("Previous")
//                                .font(.callout)
//                                .fontWeight(.medium)
//                                .foregroundColor(.blue)
//                        }
//                    }
//
//                    if(self.showNext) {
//
//                        Button(action: {
//                            self.nextTapped()
//                        }) {
//                            Text("Next")
//                                .font(.callout)
//                                .fontWeight(.semibold)
//                                .padding(.horizontal, 10)
//                                .padding(.vertical, 5)
//                                .background(Color.blue)
//                                .cornerRadius(3)
//                                .foregroundColor(.white)
//                        }
//                    }
//                }
//            }
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 15)
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
//    }
//
//    func onTapNext(_ callback: @escaping () -> ()) -> Self {
//        return .init(
//            text: self.text,
//            nextTapped: callback,
//            prevTapped: self.prevTapped,
//            showPrevious: self.$showPrevious,
//            showNext: self.$showNext
//        )
//    }
//
//    func onTapPrev(_ callback: @escaping () -> ()) -> Self {
//        return .init(
//            text: self.text,
//            nextTapped: self.nextTapped,
//            prevTapped: callback,
//            showPrevious: self.$showPrevious,
//            showNext: self.$showNext
//        )
//    }
//}
//
//struct SimpleInstructionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.white
//                .edgesIgnoringSafeArea(.all)
//
//            VStack(spacing: 5) {
//                SimpleInstructionsView(text: "This is just a tutorial asjdkfhla sdfhlakjsd hflkajsd hflkjasdhf lkjasdhf kljasd lajsdfh lkjsdhf lakjsdhf akjsl hfakjsd hadffajsdkfhlkajs hflkjas hfklja hsdjkfl haljskd fhljasdfhlaksd hflas dhfklj asdh fljasdlfjsdhfl.")
//
//                SimpleInstructionsView(text: "This is just a tutorial asjdkfhla sdfhlakjsd hflkajsd hflkjasdhf lkjasdhf kljasd lajsdfh lkjsdhf lakjsdhf akjsl hfakjsd hadffajsdkfhlkajs hflkjas hfklja hsdjkfl haljskd fhljasdfhlaksd hflas dhfklj asdh fljasdlfjsdhfl.", showNext: .constant(true))
//                    .onTapNext {
//                        print("Next Tapped")
//                    }
//
//                SimpleInstructionsView(text: "This is just a tutorial asjdkfhla sdfhlakjsd hflkajsd hflkjasdhf lkjasdhf kljasd lajsdfh lkjsdhf lakjsdhf akjsl hfakjsd hadffajsdkfhlkajs hflkjas hfklja hsdjkfl haljskd fhljasdfhlaksd hflas dhfklj asdh fljasdlfjsdhfl.", showPrevious: .constant(true))
//                    .onTapPrev {
//                        print("Previous Tapped")
//                    }
//
//                SimpleInstructionsView(text: "This is just a tutorial asjdkfhla sdfhlakjsd hflkajsd hflkjasdhf lkjasdhf kljasd lajsdfh lkjsdhf lakjsdhf akjsl hfakjsd hadffajsdkfhlkajs hflkjas hfklja hsdjkfl haljskd fhljasdfhlaksd hflas dhfklj asdh fljasdlfjsdhfl.", showPrevious: .constant(true), showNext: .constant(true))
//                    .onTapNext {
//                        print("Next Tapped")
//                    }
//                    .onTapPrev {
//                        print("Previous Tapped")
//                    }
//            }
//            .padding()
//        }
//    }
//}
