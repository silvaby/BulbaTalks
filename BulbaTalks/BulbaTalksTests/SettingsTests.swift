@testable import BulbaTalks
import XCTest

class SettingsTests: XCTestCase {
    /**
     Contains keys used to access data in UserDefaults.
     */
    private enum UserDefaultsKeys {
        /**
         Key to access the value of active network configuration.
         */
        static let activeConfiguration = "ActiveNetworkConfiguration"
    }

    func testResetMethodReinitializesSingleton() {
        // Given
        let legacySettings = Settings.shared

        // When
        Settings.shared.reset()

        // Then
        let newSettings = Settings.shared
        XCTAssert(legacySettings !== newSettings)
    }

    func testSettingsIsInitializedWithMockConfigurationWhenUserDefaultsHasInvalidActiveConfigurationKey() {
        // Given
        UserDefaults.standard.set("InvalidValue", forKey: UserDefaultsKeys.activeConfiguration)

        // When
        Settings.shared.reset()

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testSettingsIsInitializedWithMockConfigurationWhenUserDefaultsHasEmptyActiveConfigurationKey() {
        // Given
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.activeConfiguration)

        // When
        Settings.shared.reset()

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testSettingsIsInitializedWithRemoteConfigurationWhenUserDefaultsHasRemoteActiveConfigurationKey() {
        // Given
        UserDefaults.standard.set(NetworkConfigurationType.remote.rawValue,
                                  forKey: UserDefaultsKeys.activeConfiguration)

        // When
        Settings.shared.reset()

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationFromMockToRemote() {
        // Given
        Settings.shared.activateNetworkConfiguration(of: .mock)

        // When
        Settings.shared.activateNetworkConfiguration(of: .remote)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationFromRemoteToMock() {
        // Given
        Settings.shared.activateNetworkConfiguration(of: .remote)

        // When
        Settings.shared.activateNetworkConfiguration(of: .mock)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationToMockConfiguration() {
        // Given // When
        Settings.shared.activateNetworkConfiguration(of: .mock)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationToRemoteConfiguration() {
        // Given // When
        Settings.shared.activateNetworkConfiguration(of: .remote)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodStoresUpdatedRemoteActiveConfigurationInUserDefaults() {
        // Given
        Settings.shared.activateNetworkConfiguration(of: .mock)

        // When
        Settings.shared.activateNetworkConfiguration(of: .remote)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: UserDefaultsKeys.activeConfiguration),
                       NetworkConfigurationType.remote.rawValue)
    }

    func testActivateNetworkConfigurationMethodStoresUpdatedMockActiveConfigurationInUserDefaults() {
        // Given
        Settings.shared.activateNetworkConfiguration(of: .remote)

        // When
        Settings.shared.activateNetworkConfiguration(of: .mock)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: UserDefaultsKeys.activeConfiguration),
                       NetworkConfigurationType.mock.rawValue)
    }
}
