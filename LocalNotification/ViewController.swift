//
//  ViewController.swift
//  LocalNotification
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            (granted, error) in
            
            if granted{
                print("Yes")
            }else{
                print("No")
            }
        })
    }

    @IBAction func btnSendNotificationOnClick(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification Demo"
        content.subtitle = "Local Notification Generated from My Phone"
        content.body = "Notification Triggered"
    
        let imageName = "Dream1"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpg") else { return }
        
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "inflicted.m4r"))
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
            
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

