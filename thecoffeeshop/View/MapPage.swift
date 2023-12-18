////
////  MapPage.swift
////  thecoffeeshop
////
////  Created by TE-Member on 15/12/2023.
////
//
//import SwiftUI
//import MapKit
//
//
//struct MapPage: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var btnBack : some View { Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//            }) {
//            Image(systemName: "chevron.left")
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.black)
//                .frame(width: 44, height: 44)
//            }
//        }
//    
//    @State var requestLocation = CLLocationCoordinate2D(latitude: 42.6619, longitude:  21.1501)
//    @State var destinationLocation = CLLocationCoordinate2D(latitude: 42.6919, longitude: 21.1701)
//
//
//    var body: some View {
//        GeometryReader{geo in
//            VStack(spacing: 0) {
//                MyMapView(requestLocation: $requestLocation,
//                          destinationLocation: $destinationLocation)
//                .frame(height: geo.size.height*2/3)
//                
//               
//                VStack {
//                    Text("10 minutes left")
//                        .padding(.top, 16)
//                        .padding(.bottom,8)
//                    Text("Delivery to Jl. Kpg Sutoyo")
//                        .padding(.bottom,12)
//                    LinearStepIndicator(numberSteps: 4, initStep: 3)
//                        .padding(.horizontal,20)
//                        .padding(.bottom,12)
//
//                    HStack(alignment: .center) {
//                        Image("bike")
//                            .roundedRect()
//                        
//                        VStack(alignment: .leading,spacing: 0){
//                            Text("Delivered your order")
//                                .font(.system(size: 14,weight: .semibold))
//                                .padding(.bottom,8)
//                            Text("We deliver your goods to you in the shortes possible time.")
//                                .font(.system(size: 12,weight: .regular))
//                                .foregroundColor(Color.onBackground)
//                        }
//                    }
//                    .padding(14)
//                    .background(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#EAEAEA"), lineWidth: 2))
//                    .padding(.bottom,20)
//                    .padding(.horizontal,30)
//                    HStack(alignment: .center) {
//                        Image("man")
//                            .resizable()
//                            .frame(width: 54,height:54)
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(RoundedRectangle(cornerRadius: 16))
//                   
//                        VStack(alignment: .leading,spacing: 0){
//                            Text("Johan Hawn")
//                                .font(.system(size: 14,weight: .semibold))
//                                .padding(.bottom,8)
//                            Text("Personal Courier")
//                                .font(.system(size: 12,weight: .regular))
//                                .foregroundColor(Color.onBackground)
//                        }
//                        Spacer()
//                        Image("telpon")
//                            .roundedRect()
//                    }
//                    .padding(.horizontal,30)
//                    .padding(.bottom,16)
//                }
//                .foregroundColor(.white)
//                .frame(width: geo.size.width, height: geo.size.height*1/3 + 24)
//                .borderBackgroundWithRadient()
//                .offset(x:0,y:-24)
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnBack)
//        .navigationTitle("Tracking Order")
//        .navigationBarTitleDisplayMode(.inline)
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    MapPage()
//}
