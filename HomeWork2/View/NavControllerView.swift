//
//  NavControllerView.swift
//  SwiftUI_Lesson_2
//
//  Created by Vitaliy Voronok on 10.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct NavControllerView<Content>: View where Content: View {
    @ObservedObject private var viewModel: NavControllerViewModel
    
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransition, easing: Animation = .easeOut(duration: 0.3), @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = NavControllerViewModel(easing: easing)
        self.content = content()
        
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let trans):
            self.transition = (trans, trans)
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        
        return ZStack {
            Group {
                if isRoot {
                    content
                        .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
                        .environmentObject(viewModel)
                } else {
                    viewModel.currentScreen!.nextScreen
                        .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
                        .environmentObject(viewModel)
                }
            }
        }
    }
}

struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: Destination
    private let label: () -> Label

    init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        return label().onTapGesture {
            self.push()
        }
    }
    
    private func push() {
        viewModel.push(destination)
    }
}

struct NavPopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: PopDestination
    private let label: () -> Label
    
    init(destination: PopDestination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        return label().onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        viewModel.pop(to: destination)
    }
}

// Enums

enum NavTransition {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}

// Logic
private struct Screen: Identifiable, Equatable {
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

final class NavControllerViewModel: ObservableObject {
    var navigationType = NavType.push
    private let easing: Animation
    
    @Published fileprivate var currentScreen: Screen?
    
    private var screenStack = ViewStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .previous:
                screenStack.popToPrevious()
            case .root:
                screenStack.popToRoot()
            }
        }
    }
    
    private struct ViewStack {
        private var screens = [Screen]()
        func top() -> Screen? {
            screens.last
        }
        
        mutating func push(_ s: Screen) {
            screens.append(s)
        }
        
        mutating func popToPrevious() {
            _ = screens.popLast()
        }
        
        mutating func popToRoot() {
            screens.removeAll()
        }
    }
}

