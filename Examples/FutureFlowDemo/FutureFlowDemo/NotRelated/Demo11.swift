//////
//////  Demo11.swift
//////  FutureFlowDemo
//////
//////  Created by Muhand Jumah on 4/23/23.
//////
////
////import SwiftUI
////
////struct Demo11: View {
////    var body: some View {
////        ScrollView {
////            Text (
////                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec et orci metus. Donec consectetur laoreet finibus. Pellentesque at maximus leo. Donec nec elementum metus, ut interdum libero. Cras hendrerit neque non magna sodales, eu lacinia justo laoreet. Phasellus pharetra vehicula nibh, porttitor elementum velit vestibulum id. Pellentesque quis mattis risus, eget feugiat justo. Maecenas a tortor neque. Nullam placerat non mauris eget tristique. Nam auctor dolor sit amet tincidunt pulvinar.\n\nNunc cursus eget quam ut convallis. In hac habitasse platea dictumst. Integer id elit ac tellus vehicula viverra eu ac metus. Cras tempus nisl eget nulla porttitor, placerat sollicitudin justo tincidunt. Phasellus et leo mi. Curabitur convallis malesuada mi tincidunt scelerisque. Sed rutrum ultricies ligula. Pellentesque nisl metus, euismod venenatis dui sit amet, lobortis lacinia quam. Nullam ipsum est, tempus et nisl nec, consectetur fermentum nulla. Fusce velit augue, consectetur nec purus id, maximus bibendum elit. Phasellus ornare odio sit amet erat tristique dapibus. Aliquam erat volutpat. Nam hendrerit diam eget arcu dapibus lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula augue, aliquam nec condimentum quis, consectetur a erat.\nFusce at ipsum leo. Morbi egestas sem sit amet velit vestibulum gravida. Nullam eu finibus lorem. Nam ut lacus turpis. Nullam eu sagittis dui. Ut et condimentum purus. Sed et lectus pretium, imperdiet nulla sit amet, pulvinar enim. Suspendisse blandit tempus varius. Sed at consequat orci. Quisque feugiat malesuada mauris nec bibendum. Aenean condimentum ornare leo, quis porttitor risus malesuada vitae. Duis interdum odio ut scelerisque aliquet. Nam et viverra felis. Nulla eu nisi eu nisi condimentum bibendum at in odio. Aenean ut arcu quam.\nInteger non tristique turpis. Vestibulum non dolor metus. Phasellus odio lorem, consequat quis fermentum nec, faucibus scelerisque orci. Sed id placerat nibh, quis ultrices diam. Sed laoreet quis massa vel tincidunt. Proin maximus accumsan convallis. Morbi sed mi ac turpis condimentum faucibus. Donec eros nunc, dignissim vitae nibh a, pulvinar suscipit mi. Nam libero odio, rhoncus id eleifend sed, porttitor ut metus. Nunc fringilla eget ligula vel dictum. Aenean eget posuere eros. Sed placerat nec sem at faucibus. Sed vehicula sollicitudin lectus, ut consequat quam commodo in.\nIn id facilisis ligula, ut aliquet urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam dictum blandit metus vitae dignissim. Nunc ac orci sed lorem volutpat tincidunt. Nulla vel purus nunc. Duis rutrum lorem et semper scelerisque. Quisque rutrum lorem eu arcu ultricies semper. Mauris auctor vulputate est non aliquam. Vivamus viverra ullamcorper sem, et consectetur est dapibus ut. Aliquam at massa sed lectus hendrerit aliquam in et mi. Sed venenatis tincidunt sem, ut rutrum augue vestibulum vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus hendrerit quam et erat finibus tempor. Donec vehicula ut mi non ullamcorper. Sed lorem elit, hendrerit eu volutpat ut, tincidunt vel leo. "
////            )
////            .fixedSize(horizontal: false, vertical: true)
////            .frame(maxWidth: .infinity, maxHeight: .infinity)
////        }.frame(maxHeight: .infinity).padding()
////    }
////}
////
////struct Demo11_Previews: PreviewProvider {
////    static var previews: some View {
////        Demo11()
////    }
////}
//
//import SwiftUI
//@available(iOS 16.0, *)
//extension Image {
//    @MainActor func frame(width: CGFloat, height: CGFloat) -> Image {
//        let imageRenderer: ImageRenderer = .init(
//            content:
//                self
//                .resizable()
//                .frame(width: width, height: height, alignment: .center)
//        )
//
//        if let uiImage = imageRenderer.uiImage {
//            return Image(uiImage: uiImage)
//        } else {
//            return
//                Image(systemName: "x.circle")
//        }
//    }
//}
//
//@available(iOS 16.0, *)
//struct Demo11: View {
//    var body: some View {
////        ScrollView(.vertical) {
////            VStack(alignment: .leading, spacing: 10) {
////                HStack(alignment: .top, spacing: 10) {
////                    Image(systemName: "square.fill")
////                        .resizable()
////                        .frame(width: 80, height: 80)
////                        .foregroundColor(.black)
////
////                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum vulputate euismod. In facilisis diam et mollis consequat jkahdfk ladshfkljahsd fjlkahsd fjlkhasd kjlhasdjk faljk dsfljah sdfjlk hasdklj asdnf msdnf m,.asnf asdjhf ljaskhf lkjasdh fljakshd fljkash. ")
////                }
////
////                Text("Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia, dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum. ")
////            }
////        }
////        .padding()
//
//        ScrollView(.vertical) {
////            Text("Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia") + Text(Image(systemName: "square.fill")) + Text(", dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum.")
//            AsyncImage(url: .init(string: "https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png")) { img in
////                Text("Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia") +
//////                Text(img.frame(width: 80, height: 80)) +
////                Text(Image(systemName: "x.circle")) +
////                Text(", dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum.")
//
//                Text(
//                    "Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia"
//                    + Image(systemName: "x.circle")
//                    + ", dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum."
//                )
////                let m: Image = img
//////                    .resizable()
//////                    .scaledToFill()
//////                    .frame(width: 80, height: 80)
////
////                Text("TEST") +
////                Text(m.frame(width: 80, height: 80)).font(.system(size: 100)) +
////                Text("test2")
//            } placeholder: {
//                Text("Loading...")
//            }
//
////            HStack(alignment: .top, spacing: 10) {
////                VStack(alignment: .leading, spacing: 10) {
////                    Image(systemName: "square.fill")
////                        .resizable()
////                        .frame(width: 80, height: 80)
////                        .foregroundColor(.black)
////
////                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum vulputate euismod. In facilisis diam et mollis consequat jkahdfk ladshfkljahsd fjlkahsd fjlkhasd kjlhasdjk faljk dsfljah sdfjlk hasdklj asdnf msdnf m,.asnf asdjhf ljaskhf lkjasdh fljakshd fljkash. ")
////                }
////                .frame(maxWidth: 80, alignment: .topLeading)
////
////                Text("Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia, dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum. ")
////            }
//        }
//        .padding()
//
//        
////        Text("Ut vulputate ultrices erat, sit amet auctor felis tristique vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi felis leo, blandit cursus tortor eu, ullamcorper volutpat orci. Donec ornare velit sed neque scelerisque, sit amet malesuada nunc laoreet. Ut non lobortis felis, vel ultrices ligula. Nam massa mauris, volutpat et felis lacinia") +
//////                Text(img.frame(width: 80, height: 80)) +
////        Text(Image(systemName: "x.circle")).font(.system(size: 20)) +
////        Text(", dignissim efficitur arcu. Vestibulum euismod in risus at consequat. Nunc a vestibulum dolor. Vivamus sed augue lectus. Duis felis leo, gravida quis est ac, volutpat suscipit nulla. Pellentesque pharetra vulputate erat ut lobortis. Vivamus sed nibh enim. Phasellus pharetra malesuada justo quis molestie. Sed eget lectus at turpis elementum posuere quis ut velit. Morbi suscipit venenatis tempus. Ut sed arcu ipsum.")
//    }
//}
//
////struct DynamicTextModifier: ViewModifier {
////    let imageWidth: CGFloat
////    let text: String
////    let font: Font
////
////    func body(content: Content) -> some View {
////        GeometryReader { geometry in
////            let lineWidth = geometry.size.width - imageWidth
////            let textFragments = splitTextToFitWidth(text: text, lineWidth: lineWidth, font: font)
////
////            VStack(alignment: .leading, spacing: 0) {
////                ForEach(textFragments.indices, id: \.self) { index in
////                    if index == 0 {
////                        HStack {
////                            Spacer(minLength: imageWidth)
////                            Text(textFragments[index]).font(font)
////                        }
////                    } else {
////                        Text(textFragments[index]).font(font)
////                    }
////                }
////            }
////        }
////    }
////
////    private func splitTextToFitWidth(text: String, lineWidth: CGFloat, font: Font) -> [String] {
////        let words = text.split(separator: " ")
////        var textFragments: [String] = []
////        var currentLine = ""
////
////        for word in words {
////            let newLine = currentLine.isEmpty ? "\(word)" : "\(currentLine) \(word)"
////            let newSize = newLine.size(usingFont: font)
////
////            if newSize.width <= lineWidth {
////                currentLine = newLine
////            } else {
////                textFragments.append(currentLine)
////                currentLine = "\(word)"
////            }
////        }
////
////        if !currentLine.isEmpty {
////            textFragments.append(currentLine)
////        }
////
////        return textFragments
////    }
////}
////
////extension String {
////    func size(usingFont font: Font) -> CGSize {
////        let nsString = self as NSString
////        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font.size)] // Adjust this line if you use a custom font
////        return nsString.size(withAttributes: fontAttributes)
////    }
////}
////
////extension Font {
////    var size: CGFloat {
////        switch self {
////        case .largeTitle: return UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
////        case .title: return UIFont.preferredFont(forTextStyle: .title1).pointSize
////        case .title2: return UIFont.preferredFont(forTextStyle: .title2).pointSize
////        case .title3: return UIFont.preferredFont(forTextStyle: .title3).pointSize
////        case .headline: return UIFont.preferredFont(forTextStyle: .headline).pointSize
////        case .subheadline: return UIFont.preferredFont(forTextStyle: .subheadline).pointSize
////        case .body: return UIFont.preferredFont(forTextStyle: .body).pointSize
////        case .callout: return UIFont.preferredFont(forTextStyle: .callout).pointSize
////        case .caption: return UIFont.preferredFont(forTextStyle: .caption1).pointSize
////        case .caption2: return UIFont.preferredFont(forTextStyle: .caption2).pointSize
////        case .footnote: return UIFont.preferredFont(forTextStyle: .footnote).pointSize
////        default: return UIFont.preferredFont(forTextStyle: .body).pointSize
////        }
////    }
////}
////
////import SwiftUI
////
////struct Demo11: View {
////    @State private var dynamicText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus malesuada turpis, non posuere est laoreet nec. Sed maximus bibendum odio, a rhoncus nisl facilisis a. Curabitur vitae consequat justo."
////
////    var body: some View {
////        ZStack(alignment: .topLeading) {
////            Color.clear.modifier(DynamicTextModifier(imageWidth: 80, text: dynamicText, font: .body))
////
////            Image(systemName: "square.fill") // Replace with your own image
////                .resizable()
////                .frame(width: 100, height: 100) // Adjust the frame size to match your image size
////                .background(Color.red) // Optional, just to visualize the image frame
////        }
////        .padding()
////    }
////}
////
//@available(iOS 16.0, *)
//struct Demo11_Previews: PreviewProvider {
//    static var previews: some View {
//        Demo11()
//    }
//}
