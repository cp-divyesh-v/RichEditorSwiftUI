//
//  RichTextLine+SpacingPickerConfig.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension RichTextLine {
    
    /// This can be used with a ``RichTextLine/SpacingPicker``.
    struct SpacingPickerConfig {

        /// Create a custom line spacing picker config.
        ///
        /// - Parameters:
        ///   - values: The values to display in the list, by default a standard list.
        public init(
            values: [CGFloat] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        ) {
            self.values = values
        }

        /// The values to display in the list.
        public var values: [CGFloat]
    }
}

public extension RichTextLine.SpacingPickerConfig {
    
    /// The standard line spacing picker configuration.
    ///
    /// You can set a new value to change the global default.
    static var standard = Self()
}

public extension View {

    /// Apply a ``RichTextLine`` spacing picker configuration.
    func richTextLineSpacingPickerConfig(
        _ config: RichTextLine.SpacingPickerConfig
    ) -> some View {
        self.environment(\.richTextLineSpacingPickerConfig, config)
    }
}

private extension RichTextLine.SpacingPickerConfig {
    
    struct Key: EnvironmentKey {
        
        public static var defaultValue: RichTextLine.SpacingPickerConfig = .standard
    }
}

public extension EnvironmentValues {

    /// This value can bind to a line spacing picker config.
    var richTextLineSpacingPickerConfig: RichTextLine.SpacingPickerConfig {
        get { self [RichTextLine.SpacingPickerConfig.Key.self] }
        set { self [RichTextLine.SpacingPickerConfig.Key.self] = newValue }
    }
}
