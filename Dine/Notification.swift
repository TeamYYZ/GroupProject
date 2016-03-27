//
//  Notification.swift
//  Dine
//
//  Created by YiHuang on 3/24/16.
//  Copyright © 2016 YYZ. All rights reserved.
//

import Foundation
import Parse

enum NotificationType: String {
    case FriendRequest = "FriendRequest"
    case Invitation = "Invitation"
    case PrivateMessage = "PrivateMessage"
    case Unknown = "Unknown"
    
}

class UserNotification {
    var type: NotificationType
    var associatedId: String?
    var content: String
    var senderId: String
    var receiverId: String
    var senderName: String
    var senderAvatarPFFile: PFFile?
    
    // create from send notifications
    init(type: NotificationType, content: String, senderId: String, receiverId: String, associatedId: String?, senderName: String, senderAvatarPFFile: PFFile?) {
        self.type = type
        self.content = content
        self.senderId = senderId
        self.receiverId = receiverId
        if self.type == .Invitation {
            self.associatedId = associatedId
        }
        self.senderName = senderName
        self.senderAvatarPFFile = senderAvatarPFFile
    }
    
    // create from Parse
    init(dict: NSDictionary) {
        let notificationType = dict["type"] as! String
        switch notificationType {
        case "Invitation":
            self.type = .Invitation
        case "FriendRequest":
            self.type = .FriendRequest
        case "PrivateMessage":
            self.type = .PrivateMessage
        default:
            self.type = .Unknown
        }
        
        self.content = dict["content"] as! String
        self.senderId = dict["senderId"] as! String
        self.receiverId = dict["receiverId"] as! String
        self.associatedId = dict["associatedId"] as? String
        self.senderName = dict["senderName"] as! String
        self.senderAvatarPFFile = dict["senderAvatar"] as? PFFile
    }
    
    func getDict() -> NSMutableDictionary {
        let dict = NSMutableDictionary()
        dict["type"] = self.type.rawValue
        dict["content"] = self.content
        dict["senderId"] = self.senderId
        dict["receiverId"] = self.receiverId
        dict["associatedId"] = self.associatedId
        dict["senderName"] = self.senderName
        dict["senderAvatar"] = self.senderAvatarPFFile
        return dict
    }
    
    
    func saveToBackend(successHandler: (UserNotification)->(), failureHandler: (NSError?)->()) {
        PFCloud.callFunctionInBackground("addNotification", withParameters: ["notification": self.getDict()]) {
            (response: AnyObject?, error: NSError?) -> Void in
            if error == nil {
                print("Notification sent")
            } else {
                print(error!)
            }

        }
        
        
        
//        let userQuery = PFUser.query()
//        userQuery?.getObjectInBackgroundWithId(receiverId, block: { (receiver: PFObject?, error: NSError?) -> Void in
//            if error != nil {
//                print(error?.localizedDescription)
//                failureHandler(error)
//            } else if let receiver = receiver {
//                receiver.addObject(self.getDict(), forKey: "notificationsRecv")
//                receiver.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
//                    if success {
//                        successHandler(self)
//                    } else {
//                        failureHandler(error)
//                    }
//                })
//                
//            }
//            
//        })
        
    
    
    }
}