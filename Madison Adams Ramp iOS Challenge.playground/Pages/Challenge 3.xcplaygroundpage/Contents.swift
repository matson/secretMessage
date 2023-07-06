/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =

//: [Challenge 2](@previous)
//: #### Challenge 3
//: Get the prompt from Challenge 2 and paste it below.
//: Solve the challenge, and take a screenshot of the rendered view.
//: Include the screenshot of the view in your submission!

import Foundation
import SwiftUI
import PlaygroundSupport

let prompt = """
/*
 N i c e   W o r k !   F o r   t h e   f i n a l   c h a l l e n g e ,   u p d a t e   C o n t e n t V i e w . b o d y   t o   d i s p l a y   a   s m i l e y   f a c e   u s i n g   o n l y   n a t i v e   S w i f t U I   v i e w s   ( n o   S f   S y m b o l s   o r   e m o j i s ) .   B e   c r e a t i v e   a n d   h a v e   f u n !   D o n ' t   f o r g e t   t o   s u b m i t   a   s c r e e n s h o t   o f   y o u r   v i e w   w i t h   t h e   c o m p l e t e d   p l a y g r o u n d .
 */
"""

// Show your work here! When you are done take a screenshot
// of the end result and follow the submission instructions above.
// Include the screenshot of the view in your submission!


PlaygroundPage.current
    .needsIndefiniteExecution = true
PlaygroundPage.current
    .setLiveView(ContentView())

struct ContentView: View {
    //alien head
    struct AlienHead: Shape {
        func path(in rect: CGRect)-> Path{
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                              control: CGPoint(x: rect.minX, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                              control: CGPoint(x: rect.maxX, y: rect.minY))
            
            return path
            
        }
    }
    
    
    //gradient Colors:
    static let gradientEye1Start = Color(red: 85.0 / 255, green: 30.0 / 255, blue: 221.0 / 255)
    static let gradientEye1End = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    static let gradientFaceStart = Color(red: 66.0 / 255, green: 148.0 / 255, blue: 68.0 / 255)
    static let gradientFaceEnd = Color(red: 14.0 / 255, green: 47.0 / 255, blue: 120.0 / 255)
    
    static let gradientEye2Start = Color(red: 198.0 / 255, green: 12.0 / 255, blue: 198.0 / 255)
    static let gradientEye2End = Color(red: 49.0 / 255, green: 205.0 / 255, blue: 196.0 / 255)
    
    
    
    var body: some View {
        ZStack {
            AlienHead()
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientFaceStart, Self.gradientFaceEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                  ))
                .frame(width: 600, height: 560)
            VStack{
                
                //eyes
                HStack{
                    Ellipse()
                        .fill(LinearGradient(
                            gradient: .init(colors: [Self.gradientEye1Start, Self.gradientEye1End]),
                            startPoint: .init(x: 0.5, y: 0),
                            endPoint: .init(x: 0.8, y: 0.6)
                        ))
                        .frame(width: 110, height: 60)
                        .rotationEffect(Angle(degrees: 40))
                    //Spacing
                    Spacer()
                        .frame(width: 30)
                    
                    Ellipse()
                        .fill(LinearGradient(
                            gradient: .init(colors: [Self.gradientEye2Start, Self.gradientEye2End]),
                            startPoint: .init(x: 0.5, y: 0),
                            endPoint: .init(x: 0.8, y: 0.6)
                        ))
                        .frame(width: 110, height: 60)
                        .rotationEffect(Angle(degrees: 140))
                }
                
                Spacer()
                    .frame(height: 40)
                
                //nose
                HStack{
                    
                    Circle()
                        .frame(width: 10, height: 10)
                    
                    Circle()
                        .frame(width: 10, height: 10)
                }
                //mouth
                HStack{
                    Circle()
                        .trim(from: 0.5, to: 1.0)
                        .rotationEffect(Angle(degrees: 180))
                        .frame(width: 200, height: 125)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(
            Image("space")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
}
