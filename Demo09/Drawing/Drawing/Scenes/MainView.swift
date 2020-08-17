//
//  MainView.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Day 43")) {
                    NavigationLink(
                        destination: TrianglePathExample(),
                        label: {
                            Text("Basic Triangle Path")
                        }
                    )
                    
                    NavigationLink(
                        destination: CustomShapesExample(),
                        label: {
                            Text("Custom Shapes")
                        }
                    )
                }
                
                Section(header: Text("Day 44")) {
                    NavigationLink(
                        destination: RadialFlowerExample(),
                        label: {
                            Text("CGAffineTransform & Even-Odd Fills")
                        }
                    )
                    
                    NavigationLink(
                        destination: ColorGradientCyclingExample(),
                        label: {
                            Text("Activating Metal Rendering")
                        }
                    )
                }
                
                Section(header: Text("Day 45")) {
                    NavigationLink(
                        destination: BlendModesListView(),
                        label: {
                            Text("All the Blend modes")
                        }
                    )
                    
                    NavigationLink(
                        destination: ScreenedCirclesExample(),
                        label: {
                            Text("Screened Circles")
                        }
                    )
                    
                    NavigationLink(
                        destination: AnimatableDataExample(),
                        label: {
                            Text("使用AnimatableData动画自定义形状")
                        }
                    )
                    
                    NavigationLink(
                        destination: AnimatablePairExample(),
                        label: {
                            Text("对多个属性使用AnimatablePair")
                        }
                    )
                    
                    NavigationLink(
                        destination: SpirographExample(),
                        label: {
                            Text("绘制旋描仪")
                        }
                    )
                }
                
                Section(header: Text("Day 46: 挑战")) {
                    NavigationLink(
                        destination: ArrowExample(),
                        label: {
                            Text("自定义箭头形状")
                        }
                    )
                    
                    NavigationLink(
                        destination: ColorCyclingRectangleExample(),
                        label: {
                            Text("彩色矩形")
                        }
                    )
                }
            }
            .navigationTitle("SwiftUI 绘图")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
