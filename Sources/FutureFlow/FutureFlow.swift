//print("Hello, world!")

//protocol TutorialSteps {
//
//}
//
//import SwiftUI
//
//extension View {
//    func tut() {
//
//    }
//}


public final class FutureFlow {
    public init() {

    }
}

// Just a test
enum Tutorial: FlowChunk {
    case settings
    case listening
    case soundwave

    var spotLightShape: AnyView {
        switch self {
            case .listening:
                return listeningSpotlight
            case .settings:
                return rectangleShape
            default:
                return defaultSpotLight
        }
    }

    var spotlightBackground: AnyView {
        switch self {
            default:
                return self.defaultSpotlightBackground
        }
    }
}

extension Tutorial {
    fileprivate var defaultSpotLight: AnyView {
        AnyView(
            Rectangle()
                .foregroundColor(.white)
                .blur(radius: 1)
        )
    }

    fileprivate var listeningSpotlight: AnyView {
        AnyView(
            Circle()
                .foregroundColor(.white)
                .blur(radius: 1)
        )
    }
}
// End of the test


protocol FlowChunk: Hashable {
    var spotLightShape: AnyView { get }
    var spotlightBackground: AnyView { get }
}

extension FlowChunk {
    fileprivate var rectangleShape: AnyView {
        AnyView (
            Rectangle()
                .foregroundColor(Color.white)
                .blur(radius: 1)
        )
    }

    fileprivate var circleShape: AnyView {
        AnyView (
            Circle()
                .foregroundColor(Color.white)
                .blur(radius: 1)
        )
    }

    fileprivate var defaultSpotlightBackground: AnyView {
        AnyView (
            Color.black
                .edgesIgnoringSafeArea(.all)
        )
    }
}

import SwiftUI

extension View {
    func test<Chunk: FlowChunk>(parentIdentifier: String, chunk: Chunk) -> some View {
//        let namespace = Namespace()
//        FutureFlowManager.currentNamespaces[uniqueIdentifier] = namespace
        var namespace: Namespace!
        if let namespace2 = FutureFlowManager.currentNamespaces[parentIdentifier] {
            namespace = namespace2
        } else {
            namespace = Namespace()
            FutureFlowManager.currentNamespaces[parentIdentifier] = namespace
        }

        return self
            .matchedGeometryEffect(
                id: chunk.hashValue,
                in: namespace.wrappedValue,
                properties: .frame,
                anchor: .center,
                isSource: true
            )
    }

    func test3<Chunk: FlowChunk>(uniqueIdentifier: String, chunks: [Chunk]) -> some View {
        return HighlightingView(showTutorial: .constant(true),
                         chunks: chunks) {
        }
    }
}

internal struct SpotlightView<Chunk: FlowChunk>: View {
    internal var chunk: Chunk
    internal var namespace: Namespace.ID

    internal var body: some View {
        ZStack {
            self.chunk.spotlightBackground

            self.chunk.spotLightShape
                .matchedGeometryEffect(
                    id: self.chunk.hashValue,
                    in: namespace,
                    properties: .frame, anchor: .center,
                    isSource: false
                )
                .blendMode(.destinationOut)
        }
        .compositingGroup()
    }
}

internal struct HighlightingView<Content: View, Chunk: FlowChunk>: View {
    @Namespace private var namespace

    @Binding var showTutorial: Bool
    let chunks: [Chunk]
    let content: Content

    @State private var currentIndex: Int = 0

    init(showTutorial: Binding<Bool>, chunks: [Chunk], @ViewBuilder content: () -> Content) {
        self._showTutorial = showTutorial
        self.chunks = chunks
        self.content = content()
    }

    var body: some View {
        ZStack {
            self.content

            SpotlightView(
                chunk: self.chunks[self.currentIndex],
                namespace: self.namespace
            )
                .opacity(self.showTutorial ? 0.5 : 0)
                .animation(
                    .easeOut,
                    value: self.showTutorial ? self.currentIndex : nil
                )
        }
    }
}

struct ContentView: View {
    @State private var tuts: [Tutorial] =
    [
        .listening,
        .settings,
        .soundwave
    ]

    private let uniqueIdentifier: String = UUID().uuidString

    var body: some View {
        ZStack {
            Text("TEST")
                .test(parentIdentifier: self.uniqueIdentifier, chunk: self.tuts[0])//, chunk: self.tuts[0])
        }
        .test3(uniqueIdentifier: self.uniqueIdentifier, chunks: self.tuts)
    }
}

internal class FutureFlowManager {
    internal static var currentNamespaces: [String:Namespace] = [:]
}
