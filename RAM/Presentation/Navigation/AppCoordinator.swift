//
//  AppCoordinator.swift
//  RAM
//
//  Created by Mario Corte on 2/16/25.
//

import SwiftUI

protocol Steps: Equatable, Hashable { }

protocol AppCoordinator: ObservableObject {
    associatedtype CoordinatorSteps: Steps
    associatedtype CoordinatorView: View

    var path: [CoordinatorSteps] { get set }

    func redirect(_ path: CoordinatorSteps) -> CoordinatorView
}

// MARK: - Navigation Modifier

private struct NavigationSetupModifier<CoordinatorType: AppCoordinator>: ViewModifier {
    @ObservedObject var coordinator: CoordinatorType
    
    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: CoordinatorType.CoordinatorSteps.self) { step in
                    coordinator.redirect(step)
                }
//                .sheet(item: T##Binding<Item?>, onDismiss: T##(() -> Void)?, content: T##(Item) -> Content)
        }
    }
}

extension View {
    func applyNavigation<CoordinatorType: AppCoordinator>(coordinator: CoordinatorType) -> some View {
        self.modifier(NavigationSetupModifier(coordinator: coordinator))
    }
}
