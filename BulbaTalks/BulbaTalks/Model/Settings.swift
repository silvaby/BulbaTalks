import Foundation

/**
 Stores the application settings.

 Allows to toggle between network configurations and persistently
 stores the configuration which is currently active.
 */
class Settings {
    /**
     The active network configuration.
     */
    private(set) var activeNetworkConfiguration: NetworkConfiguration

    /**
     A shared singleton settings object.
     */
    private(set) static var shared = Settings()

    /**
     Describes the keys for the user defaults database.
     */
    private enum Keys {
        /**
         The key associated with the active network configuration.
         */
        static let activeConfiguration = "ActiveNetworkConfiguration"
    }

    /**
     Initializes `Settings` object from the persistent storage.
     */
    private init() {
        activeNetworkConfiguration = MockNetworkConfiguration()

        if let configuration = UserDefaults.standard.string(forKey:
            Keys.activeConfiguration),
            let configurationType = NetworkConfigurationType(rawValue: configuration) {
            activeNetworkConfiguration = networkConfiguration(of: configurationType)
        } else {
            UserDefaults.standard.set(NetworkConfigurationType.mock.rawValue,
                                      forKey: Keys.activeConfiguration)
        }
    }

    #if DEBUG
        /**
         Reinitialize current instance.
         */
        func reset() {
            Settings.shared = Settings()
        }
    #endif

    /**
     Activates the network configuration with a given type.
     - Parameter type: Type of the network configuration to use.
     */
    func activateNetworkConfiguration(of type: NetworkConfigurationType) {
        UserDefaults.standard.set(type.rawValue, forKey: Keys.activeConfiguration)
        activeNetworkConfiguration = networkConfiguration(of: type)
    }

    /**
     Gets the network configuration of the given type.
     - Parameter type: The value of the type network
     configuration to get.
     - Returns: The network configuration.
     */
    private func networkConfiguration(of type: NetworkConfigurationType) -> NetworkConfiguration {
        switch type {
        case .mock:
            return MockNetworkConfiguration()
        case .remote:
            return RemoteNetworkConfiguration()
        }
    }
}
