//
//  Colors.swift
//  AppBackFront
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import SwiftUI


struct QuotationCellColors {
    static let background = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1)
    static let cellBackground = UIColor(red: 58/255, green: 52/255, blue: 57/255, alpha: 1.0)
    static let borderColor = UIColor(red: 131/255, green: 127/255, blue: 131/255, alpha: 1).cgColor
    static let ethValueTextColor =  UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
}

struct TransactionCellColors {
    static let background = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
    
    struct Exit {
        static let priceLabel = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        static let valueLabel = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
        static let dateEndHourLabel = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
    }
    
    struct Other {
        static let priceLabel =  UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
        static let valueLabel = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        static let dateEndHourLabel = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
    }
   
    
}
