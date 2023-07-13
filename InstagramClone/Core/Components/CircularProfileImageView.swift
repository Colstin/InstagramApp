//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/13/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

//MARK: This uses the King Fisher Package
// It automatically Caches so we dont need to do anything
struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
    }
}
