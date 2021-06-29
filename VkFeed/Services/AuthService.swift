//
//  AuthService.swift
//  VkFeed
//
//  Created by Anton Redkozubov on 28.06.2021.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSingIn()
    func authServiceSingInDidFalied()
}
class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {

    private let appID = "7890665"
    private let vkSdk: VKSdk

    weak var delegate: AuthServiceDelegate?

    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VKSdk init")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }

    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, _) in
            switch state {
            case .authorized:
                print("authorized")
                delegate?.authServiceSingIn()
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            default:
                delegate?.authServiceSingInDidFalied()
            }
        }
    }

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSingIn()
        }
    }

    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSingInDidFalied()
    }

    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }

    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
