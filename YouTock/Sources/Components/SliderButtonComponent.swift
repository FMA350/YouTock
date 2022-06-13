//
//  SliderButtonComponent.swift
//  YouTock
//
//  Created by Francesco Maria Moneta on 6/11/22.
//

import SwiftUI

struct SliderButtonComponent: View {
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State var ShapeColor : Color
    
    var sliderCompletes: () -> ()

    var body: some View {
        ZStack
        {
            //1. Background
            Capsule()
                .fill(ShapeColor.opacity(0.2))
            Capsule()
                .fill(Color.white.opacity(0.2))
                .padding(8)
            //2. Call-To-Action (static)
            Text("Get started")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 10)
            //3. Capsule (Dynamic width)
            HStack{
                Capsule()
                    .fill(ShapeColor)
                    .frame(width: buttonOffset + 80)
                Spacer()
            }
            //4. Circle (draggable)
            HStack {
                ZStack
                {
                    Circle()
                        .fill(ShapeColor)
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding(8)
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24, weight: .bold))
                     
                } // : ZStack
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            if (gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80)
                            {
                                buttonOffset = gesture.translation.width
                            }
                        })
                        .onEnded({ _ in
                            if (buttonOffset > buttonWidth / 2)
                            {
                                sliderCompletes()
                                buttonOffset = buttonWidth - 80
                                
                            }
                            else
                            {
                                buttonOffset = 0;
                            }
                        })
                )//: GESTURE
                
                Spacer()

            } //: HSTACK
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
    }
    
        
}

struct SliderButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            Color(.gray)
                .ignoresSafeArea()
            SliderButtonComponent(ShapeColor: .red) {
               print("Slider hit")
            }

        }
    }

}
