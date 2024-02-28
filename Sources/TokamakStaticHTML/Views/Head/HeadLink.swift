import Foundation

public struct HTMLHeadLink {
    public var rel: String
    public var href: String
    public var type: String?

    public init(rel: String, href: String, type: String? = nil) {
        self.rel = rel
        self.href = href
        self.type = type
    }

    public var htmlLiteral: String {
        if let type {
            return "<link rel=\"\(rel)\" href=\"\(href)\" type=\"\(type)\"/>"
        } else {
            return "<link rel=\"\(rel)\" href=\"\(href)\"/>"
        }
    }
}

public extension View {
  func htmlHeadLink(rel: String, href: String, type: String? = nil) -> some View {
      htmlHeadLink(HTMLHeadLink(rel: rel, href: href, type: type))
  }

  func htmlHeadLink(_ value: HTMLHeadLink) -> some View {
      Group {
        self
        EmptyView()
          .preference(key: HTMLHeadLinkPreferenceKey.self, value: [value])
      }
  }
}
