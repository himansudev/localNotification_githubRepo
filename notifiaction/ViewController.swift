//
//  ViewController.swift
//  notifiaction
//
//  Created by Himansu Sekhar Panigrahi on 01/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//


//Source:  https://www.youtube.com/watch?v=yMbujKTf0uQ



import UIKit

class ViewController: UIViewController,UNUserNotificationCenterDelegate
{
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var tf: UITextField!
    let notificationCenter = UNUserNotificationCenter.current()
    let categoryIdentifier = "My Category Identifier"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initialSetup()
        
    }
    
    func initialSetup()
    {
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.badge,.alert,.sound], completionHandler: {
            (sucess,err)
            in
        })
        
        
        self.button.addTarget(self, action: #selector(buttonEH), for: UIControl.Event.touchUpInside)
        
        
        
    }

    @objc func buttonEH()
    {
        
        //Content
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = self.categoryIdentifier
        content.title = "Local Notification"
        content.body  = "ajsdhsjbhffds"
        content.badge = 1
        content.sound = UNNotificationSound.default
        content.userInfo = ["name":"abcdyy"]
        
        
        //Content Image
        let url = Bundle.main.url(forResource: "car", withExtension: "jpg")
        let attachment = try! UNNotificationAttachment(identifier: "image", url: url!, options: [:])
        content.attachments = [attachment]
        
        
        
        
        //Trigger Time
        let trigget = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let identifier = "Maon Identifier"
        
        
        //Request
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigget)
        
        
        //Add requset to the notification center
        notificationCenter.add(request) { (error) in
            print(error?.localizedDescription)
        }
        
        
     
        
        //Notification Action
        let like = UNNotificationAction.init(identifier: "Like", title: "Like", options: UNNotificationActionOptions.foreground)
        
        let delete = UNNotificationAction.init(identifier: "Delete", title: "Delete", options: UNNotificationActionOptions.destructive)
        
        let category
            = UNNotificationCategory.init(identifier: content.categoryIdentifier, actions: [like,delete], intentIdentifiers: [], options: [])
        
        
        
        notificationCenter.setNotificationCategories([category])
       
        
        
        
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert,.badge,.sound])
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        let secondVC = SecondViewController()
        secondVC.label.text = (response.notification.request.content.userInfo as! [AnyHashable:Any])["name"] as! String
        
       
        self.present(secondVC, animated: true, completion: nil)
        
        
    }
}

