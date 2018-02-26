//
//  Group.swift
//  Peek
//
//  Created by Shaps Benkau on 24/02/2018.
//

import Foundation

@objc public enum Group: Int {
    case preview
    case accessibility
    case appearance
    case paragraph
    case behaviour
    case states
    case shadow
    case border
    case general
    
    case horizontal
    case vertical
    case hugging
    case resistance
    case constraints
    
    case layout
    case classes
    case views
    case layers
    
    internal var title: String {
        switch self {
        case .preview: return "Preview"
        case .appearance: return "Appearance"
        case .accessibility: return "Accessibility"
        case .general: return "General"
        case .paragraph: return "Paragraph"
        case .states: return "States"
        case .behaviour: return "Behaviour"
        case .constraints: return "Constraints"
        case .hugging: return "Hugging"
        case .resistance: return "Resistance"
        case .horizontal: return "Horizontal"
        case .vertical: return "Vertical"
        case .layout: return "Layout"
        case .classes: return "Classes"
        case .views: return "Views"
        case .layers: return "Layers"
        case .shadow: return "Shadow"
        case .border: return "Border"
        }
    }
    
    internal func peekGroup() -> PeekGroup {
        return PeekGroup(title: title, group: self)
    }
    
    internal static var all: [Group] {
        var values: [Group] = []
        var index = 0
        
        while let element = self.init(rawValue: index) {
            values.append(element)
            index += 1
        }
        
        return values
    }
}

@objc public protocol PeekGroupProtocol: class {
    var title: String { get }
    var attributes: [Attribute] { get }
}

internal final class PeekGroup: PeekGroupProtocol, Hashable, CustomStringConvertible {
    
    internal let title: String
    internal var attributes: [Attribute]
    internal let group: Group
    
    internal init(title: String, group: Group) {
        self.title = title
        self.group = group
        self.attributes = []
    }
    
    internal var hashValue: Int {
        return title.hashValue
    }
    
    internal static func ==(lhs: PeekGroup, rhs: PeekGroup) -> Bool {
        return lhs.title == rhs.title
    }
    
    public var description: String {
        return """
        \(title)
        \(attributes.map { "  ▹ \($0)" }.joined(separator: "\n"))
        """
    }
    
}
