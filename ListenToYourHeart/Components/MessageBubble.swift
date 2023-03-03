//
//  MessageBubble.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.02.23.
//

import Foundation

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("PurpleLight").opacity(0.25) : Color("OrangeLight").opacity(0.25))
                    .cornerRadius(8)
            }
            .frame(maxWidth: 310, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(message.received ? .leading : .trailing,25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
       // .padding(.horizontal, 5)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1", text: "Hey, how are you doing? I hope you are doing fine. When will we meet?", received: true, timestamp: Date()))
    }
}

