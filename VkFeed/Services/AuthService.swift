//
//  AuthService.swift
//  VkFeed
//
//  Created by Anton Redkozubov on 28.06.2021.
//

import Foundation
import VK_ios_sdk

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {

    private let appID = "7890665"
    private let vkSdk: VKSdk

    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VKSdk init")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }

    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }

    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }

    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
