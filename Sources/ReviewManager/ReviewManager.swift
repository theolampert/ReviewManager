import Foundation
import StoreKit

public struct ReviewManager {
    enum defaultsKeys: String {
        case reviewWorthyActionCount = "reviewWorthyActionCount"
        case lastReviewRequestAppVersion = "lastReviewRequestAppVersion"
    }

    public static func requestReview(atActionCount actionCount: Int = 5) {
        let defaults = UserDefaults.standard
        let bundle = Bundle.main

        var actionCount = defaults.integer(forKey: defaultsKeys.reviewWorthyActionCount.rawValue)
        actionCount += 1

        defaults.set(actionCount, forKey: defaultsKeys.reviewWorthyActionCount.rawValue)

        guard actionCount >= actionCount else {
            return
        }

        let bundleVersionKey = kCFBundleVersionKey as String
        let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
        let lastVersion = defaults.string(forKey: defaultsKeys.lastReviewRequestAppVersion.rawValue)

        guard lastVersion == nil || lastVersion != currentVersion else {
            return
        }

        SKStoreReviewController.requestReview()

        defaults.set(0, forKey: defaultsKeys.reviewWorthyActionCount.rawValue)
        defaults.set(currentVersion, forKey: defaultsKeys.lastReviewRequestAppVersion.rawValue)
    }
}
