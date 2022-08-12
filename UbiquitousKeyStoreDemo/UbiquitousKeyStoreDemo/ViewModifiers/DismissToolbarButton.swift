//
//  DismissToolbarButton.swift
//  UbiquitousKeyStoreDemo
//
//  Created by Rob Ranf on 8/12/22.
//

import SwiftUI

struct DismissToolbarButton: ViewModifier {
    @FocusState var focusedField: Bool?
    func body(content: Content) -> some View {
        return content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            focusedField = nil
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
    }
}

extension View {
    func dismissToolbarButton(focusedField: FocusState<Bool?>) -> some View {
        self.modifier(DismissToolbarButton(focusedField: focusedField))
    }
}
