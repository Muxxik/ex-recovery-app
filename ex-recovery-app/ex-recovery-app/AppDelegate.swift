//
//  AppDelegate.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import Foundation
import UIKit
import Firebase
import UserNotifications




class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        // Инициализация Firebase
        FirebaseApp.configure()

        // Настройка пушей
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("🔔 Push permission granted: \(granted)")
        }
        

        application.registerForRemoteNotifications()
        return true
    }

    // Получение FCM токена (необязательно, но полезно для логов)
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    

}

