//
//  TrackingMap.swift
//  thecoffeeshop
//
//  Created by TE-Member on 18/12/2023.
//

import SwiftUI
import MapKit


extension CLLocationCoordinate2D {

    static let theCoffeeShop = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369 )
    
    static let orderLocation = CLLocationCoordinate2D(latitude: 42.547408, longitude: -70.870085 )
}


struct TrackingMap: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var nav: NavigationStackState
    var btnBack : some View {
        
            Button {
                nav.popToHome()
                
            }label: {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                }
            }
        
    @State private var route: MKRoute?
    @Binding var orderLocation: MKMapItem
    
    
    init(orderLocation: Binding<MKMapItem>){
        self._orderLocation = orderLocation
        UINavigationBar.appearance().tintColor = .orange
    }
    
    func getDirections(){
        route = nil
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .theCoffeeShop))
        request.destination = orderLocation
        Task{
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
    
    var body: some View {
        Map(){
            Annotation("The Coffee Shop", coordinate: .theCoffeeShop){
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.onBackground, lineWidth: 1)
                    Image("pin")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
            
            Annotation("Order Location", coordinate: .orderLocation){
                ZStack {
                    Circle()
                        .fill(.background)
                    Circle()
                        .stroke(Color.onBackground, lineWidth: 1)
                    Image("bike")
                        .padding(5)
                }
            }
            
            if let route {
                MapPolyline(route)
                    .stroke(Color.appPrimary, lineWidth: 4)
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom){
            HStack{
                Spacer()
                VStack(spacing: 0)
                {
                    Text("10 minutes left")
                        .padding(.top, 16)
                        .padding(.bottom,8)
                    Text("Delivery to Jl. Kpg Sutoyo")
                        .padding(.bottom,12)
                    LinearStepIndicator(numberSteps: 4, initStep: 3)
                        .padding(.horizontal,20)
                        .padding(.bottom,12)

                    HStack(alignment: .center) {
                        Image("bike")
                            .roundedRect()
                        
                        VStack(alignment: .leading,spacing: 0){
                            Text("Delivered your order")
                                .font(.system(size: 14,weight: .semibold))
                                .padding(.bottom,8)
                            Text("We deliver your goods to you in the shortes possible time.")
                                .font(.system(size: 12,weight: .regular))
                                .foregroundColor(Color.onBackground)
                        }
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#EAEAEA"), lineWidth: 2))
                    .padding(.bottom,20)
                    .padding(.horizontal,30)
                    HStack(alignment: .center) {
                        Image("man")
                            .resizable()
                            .frame(width: 54,height:54)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                   
                        VStack(alignment: .leading,spacing: 0){
                            Text("Johan Hawn")
                                .font(.system(size: 14,weight: .semibold))
                                .padding(.bottom,8)
                            Text("Personal Courier")
                                .font(.system(size: 12,weight: .regular))
                                .foregroundColor(Color.onBackground)
                        }
                        Spacer()
                        Image("telpon")
                            .roundedRect()
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,16)
                    
                }
                .foregroundColor(.white)
                .frame(height: 300)
                Spacer()
            }
            .background(LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .bottomLeading, endPoint: .topTrailing))
            .borderBackgroundWithRadient()
        }
        .onAppear{
            getDirections()
        }
        .onChange(of: orderLocation){
            getDirections()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationTitle("Tracking Order")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .bottomLeading, endPoint: .topTrailing), for: .navigationBar)

    }

}

#Preview {
    @State var orderLocation = MKMapItem(placemark:  MKPlacemark(coordinate: .orderLocation));
   return TrackingMap(orderLocation: $orderLocation )
}

