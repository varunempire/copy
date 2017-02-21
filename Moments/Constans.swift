//
//  Constans.swift
//  Moments
//
//  Created by Varun Kumar on 25/01/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import Foundation


struct moments {
    struct parameter {
        static let email = "email"
        static let me = "me"
        static let fields = "fields"
        static let params = "id, name, first_name, last_name, picture.type(large), email"
        
    }
    struct title {
        static let timeLineTitle = "Moments"
        static let settingsTitle = "Settings"
        static let menuTitle = "Menu"
    }
    struct notification {
        static let notificationIdentifier = "NotificationIdentifier"
        
    }
    struct menu {
        static let home = "Home"
        static let settings = "Settings"
        static let logout = "Logout"
        
    }
    struct cell {
        static let cellIdentifier = "timeLineCell"
        static let imageCell = "imageCell"
    }
    struct storyBord {
        static let name = "Main"
        static let slideMenu = "slideMenu"
        static let loginView = "loginView"
        static let homeView = "homeView"
        static let timelineview = "timeLineView"
    }
    struct alert {
        static let logoutTitle = "Logout"
        static let logoutMessage = "Are you sure want to logout ?"
        static let yesTitle = "Yes"
        static let noTitle = "No"
    }
    struct key {
        static let launchedBefore = "launchedBefore"
    }
    struct image {
        static let bgMenuItem = "bg_menuItem"
        static let bgMenuitemHighlighted = "bg-menuitem-highlighted"
        static let iconCamera = "icon-camera"
        static let iconAudio = "icon-audio"
        static let iconEditor = "icon-editor"
        static let bgAddbutton = "bg-addbutton"
        static let bgAddbuttonHighlighted = "bg-addbutton-highlighted"
        static let iconPlus = "icon-plus"
        static let iconPlusHighlighted = "icon-plus-highlighted"
    }
}
