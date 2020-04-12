//
//  PhotoModel.swift
//  Gallery
//
//  Created by George Kyrylenko on 12.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import Foundation

struct PhotoModel: Codable{
    var id: String?
    var width: Int?
    var height: Int?
    var alt_description: String?
    var urls: PhotoURLsModel?
    var likes: Int?
    var user: UserModel?
}

struct PhotoURLsModel: Codable{
    var raw: String?
    var full: String?
}

struct UserModel: Codable{
    var username: String?
    var instagram_username: String?
    var profile_image: ProfileImageModel?
}

struct ProfileImageModel: Codable{
    var small: String?
    var medium: String?
}

//{
//    "id": "oqmIM9bkAWQ",
//    "created_at": "2019-07-11T19:20:11-04:00",
//    "updated_at": "2020-04-07T01:02:58-04:00",
//    "promoted_at": null,
//    "width": 8000,
//    "height": 8000,
//    "color": "#0B050B",
//    "description": null,
//    "alt_description": "sunglasses and mascara on pink surface",
//    "urls": {
//        "raw": "https://images.unsplash.com/photo-1562887189-e5d078343de4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyNTI3Nn0",
//        "full": "https://images.unsplash.com/photo-1562887189-e5d078343de4?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEyNTI3Nn0",
//        "regular": "https://images.unsplash.com/photo-1562887189-e5d078343de4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyNTI3Nn0",
//        "small": "https://images.unsplash.com/photo-1562887189-e5d078343de4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEyNTI3Nn0",
//        "thumb": "https://images.unsplash.com/photo-1562887189-e5d078343de4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEyNTI3Nn0"
//    },
//    "links": {
//        "self": "https://api.unsplash.com/photos/oqmIM9bkAWQ",
//        "html": "https://unsplash.com/photos/oqmIM9bkAWQ",
//        "download": "https://unsplash.com/photos/oqmIM9bkAWQ/download",
//        "download_location": "https://api.unsplash.com/photos/oqmIM9bkAWQ/download"
//    },
//    "categories": [],
//    "likes": 653,
//    "liked_by_user": false,
//    "current_user_collections": [],
//    "user": {
//        "id": "o9M2-GtNlBE",
//        "updated_at": "2020-04-12T07:31:06-04:00",
//        "username": "honest",
//        "name": "The Honest Company",
//        "first_name": "The Honest Company",
//        "last_name": null,
//        "twitter_username": "honest",
//        "portfolio_url": "https://www.honest.com/",
//        "bio": "Our mission is to empower people to live healthy, happy lives. We're committed to creating effective, safe, delightful, accessible, responsible products.",
//        "location": null,
//        "links": {
//            "self": "https://api.unsplash.com/users/honest",
//            "html": "https://unsplash.com/@honest",
//            "photos": "https://api.unsplash.com/users/honest/photos",
//            "likes": "https://api.unsplash.com/users/honest/likes",
//            "portfolio": "https://api.unsplash.com/users/honest/portfolio",
//            "following": "https://api.unsplash.com/users/honest/following",
//            "followers": "https://api.unsplash.com/users/honest/followers"
//        },
//        "profile_image": {
//            "small": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
//            "medium": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
//            "large": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
//        },
//        "instagram_username": "honest",
//        "total_collections": 0,
//        "total_likes": 0,
//        "total_photos": 65,
//        "accepted_tos": true
//    },
//    "sponsorship": {
//        "impression_urls": [
//            "https://secure.insightexpressai.com/adServer/adServerESI.aspx?script=false&bannerID=5209905&rnd=unsplash&redir=https://secure.insightexpressai.com/adserver/1pixel.gif"
//        ],
//        "tagline": "Clean beauty that works.",
//        "sponsor": {
//            "id": "o9M2-GtNlBE",
//            "updated_at": "2020-04-12T07:31:06-04:00",
//            "username": "honest",
//            "name": "The Honest Company",
//            "first_name": "The Honest Company",
//            "last_name": null,
//            "twitter_username": "honest",
//            "portfolio_url": "https://www.honest.com/",
//            "bio": "Our mission is to empower people to live healthy, happy lives. We're committed to creating effective, safe, delightful, accessible, responsible products.",
//            "location": null,
//            "links": {
//                "self": "https://api.unsplash.com/users/honest",
//                "html": "https://unsplash.com/@honest",
//                "photos": "https://api.unsplash.com/users/honest/photos",
//                "likes": "https://api.unsplash.com/users/honest/likes",
//                "portfolio": "https://api.unsplash.com/users/honest/portfolio",
//                "following": "https://api.unsplash.com/users/honest/following",
//                "followers": "https://api.unsplash.com/users/honest/followers"
//            },
//            "profile_image": {
//                "small": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
//                "medium": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
//                "large": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
//            },
//            "instagram_username": "honest",
//            "total_collections": 0,
//            "total_likes": 0,
//            "total_photos": 65,
//            "accepted_tos": true
//        }
//    }
//},
