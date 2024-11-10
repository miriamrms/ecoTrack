//
//  ResourcesView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 31/10/24.
//

import SwiftUI
import Foundation
import SwiftData

struct ResourceView: View {
    @EnvironmentObject var resourceViewModel: ResourcesViewModel
    
    var resourceType: Resources
    var resource: ResourceData
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var showGastoMensalSheet: Bool = false
    @State var showHistorySheet: Bool = false
    @State var quantidadeGasta: String = ""
    @State var valorGasta: String = ""
    
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 40){
                ZStack{
                    resource.type.cor[1] //Cor do Recurso
                    Image(resource.type.bgImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: width)
                    
                    VStack(){
                        HStack{
                            Image(resource.type.singleIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 27)
                            Text(resource.type.rawValue)
                        }
                        .padding(.top, height * 0.08)
                        .font(.system(size: 19, weight: .bold))
                        Spacer()
                        HStack{
                            VStack(alignment: .leading){
                                HStack(alignment: .bottom){
                                    Image("bar-chart-2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 27)
                                    Text("Média Mensal")
                                }
                                .font(.system(size: 16, weight: .regular))
                                Divider()
                                    .overlay(Color.white)
                                HStack{
                                    Image("ruler")
                                    Text("\(String(format: "%2.f",resource.spendMediaAmount)) \(resource.type.measurement)")
                                }
                                .font(.system(size: 23, weight: .bold))
                                HStack{
                                    Image("coin")
                                    Text(String(format: "R$%2.f",resource.spendMediaPrice))
                                }
                                .font(.system(size: 23, weight: .bold))
                                
                            }
                            .frame(width: width*0.40)
                            Spacer()
                            VStack{
                                Button {
                                    showHistorySheet.toggle()
                                } label: {
                                    ZStack{
                                        HStack{
                                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                                                .font(.system(size: 18, weight: .bold))
                                            Text("Histórico")
                                        }
                                        .foregroundColor(resource.type.cor[1])
                                        .padding(.top, 14)
                                        .padding(.bottom, 14)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }
                                .sheet(isPresented: $showHistorySheet) {
                                    HistorySheetView(resourceType: resourceType)
                                    //                                        .environmentObject(resourceViewModel)
                                }
                                Button {
                                    showGastoMensalSheet.toggle()
                                    
                                } label: {
                                    ZStack{
                                        VStack{
                                            Image(systemName: "plus.app")
                                                .font(.system(size: 18, weight: .bold))
                                            Text("Adicionar Gasto Mensal")
                                        }
                                        .foregroundColor(resource.type.cor[1])
                                        .padding(.top, 14)
                                        .padding(.bottom, 14)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }
                                .sheet(isPresented: $showGastoMensalSheet) {
                                    GastoMensalSheetView(resource: resource)
                                }
                            }
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: width*0.34)
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(20)
                    
                    
                }
                .ignoresSafeArea()
                .frame(maxHeight: 299)
                .foregroundColor(Color.white)
                .frame(alignment: .top)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Analysis.allCases, id: \.self){ analysis in
                            AnalysisButtonView(analysis: analysis, resource: resource)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                VStack(alignment: .leading){
                    HStack{
                        Image("greenLeaf")
                        Text("Metas sustentáveis")
                        
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.verdeClaro)
                    .padding(.leading, 15)
                    
                    VStack(spacing: 12){
                        ResourceGoalsView(resource: resourceType)
                        ResourceGoalsView(resource: resourceType)
                    }
                    .padding(.bottom, 30)
                    
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear() {
            
        }
        .ignoresSafeArea()
        
    }
    
}

#Preview {
    ResourceView(resourceType: .agua, resource: ResourceData(type: .agua, spendMedia: 0.0))
}

struct HistorySheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var resourceViewModel: ResourcesViewModel
    @State private var selectionYear = "2024"
    @State var isShowingYearPicker = false
    var resourceType: Resources
    var spending: [SpendData] {
        if resourceViewModel.resources.isEmpty {
            return []
        }
        for resource in resourceViewModel.resources {
            if resource.type == resourceType {
                // Retorna o histórico (história) do recurso específico
                return resource.history
            }
        }
        return []
    }
    
    var teste: [SpendData] = [.init(
        resource: ResourceData(type: .agua),
        data: .init(),
        price: 44,
        amount: 23
    )]
    
    //    var resource: ResourceData
    var body: some View {
        VStack(spacing: 18){
            HStack {
                Text("Histórico de consumo")
                Spacer()
                Button {
                    isShowingYearPicker.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                        HStack {
                            Text(selectionYear)
                            Image(systemName: "chevron.down")
                        }
                        .foregroundStyle(Color.white)
                    }
                    .frame(width: 100, height: 34)
                    
                }
                .sheet(isPresented: $isShowingYearPicker){
                    YearPickerView(selectionYear: $selectionYear)
                        .presentationDetents([.fraction((0.35))])
                }
                
            }
            .foregroundStyle(resourceType.cor[1])
            .font(.system(size: 19, weight: .bold))
            .padding(.top, 28)
            .padding(.bottom, 28)
            
            HStack {
                Text("Mês")
                Spacer()
                Text(resourceType.measurement)
                Spacer()
                Text("Valor")
            }
            .foregroundStyle(resourceType.cor[1])
            .font(.system(size: 20, weight: .bold))
            
            ScrollView(.vertical) {
                
                //                ForEach(resourceViewModel.resources, id: \.id) { r in
                //                    Text(r.type.rawValue)
                //                    Text("\(r.history)")
                //                }
                //                .foregroundStyle(Color.black)
                
                ForEach(spending){gasto in
//                    let components = gasto.data.get(.day, .month, .year)
                    HStack{
//                        if let month = components.month{
//                            Text("\(month)")
//                        }
                        Text("\(formatMonth(date: gasto.data))")
                            .font(.system(size: 19, weight: .bold))
                        Spacer()
                        Text(String(format: "%.2f", gasto.amount))
                            .font(.system(size: 19, weight: .regular))
                        Spacer()
                        Text(String(format: "R$%.2f", gasto.price))
                            .font(.system(size: 19, weight: .regular))
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(.azulEscuroDark)
                }
                .foregroundStyle(Color.azulEscuroDark)
                
            }
            .padding(.bottom, 10)
            
        }
        .presentationDetents([.medium, .large])
        .frame(maxWidth: .infinity)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct GastoMensalSheetView: View {
    @EnvironmentObject var resourceViewModel: ResourcesViewModel
    @Environment(\.dismiss) var dismiss
    @State var date = Date.now
    @State var amount: Double?
    @State var price: Double?
    var resource: ResourceData
    
    var body: some View {
        
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
        
        NavigationStack {
            Form{
                Text("Adicionar um Gasto de \(resource.type.rawValue)")
                Section{
                    TextField("Quanditade gasta em \(resource.type.measurement)", value: $amount, formatter: formatter)
                    TextField("Valor gasto em R$", value: $price, formatter: formatter)
                    DatePicker("Data", selection: $date, displayedComponents: .date)
                        .accentColor(resource.type.cor[1])
                }
            }
            .foregroundStyle(Color.verdeEscuroDark)
            .navigationTitle("Novo Gasto | \(resource.type.rawValue)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancelar"){
                        dismiss()
                    }
                    .foregroundStyle(Color(.red))
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Criar"){
                        var priceToSave: Double = 0.0
                        var amountToSave: Double = 0.0
                        if let price {
                            priceToSave = price
                        }
                        if let amount{
                            amountToSave = amount
                        }
                        resourceViewModel.addSpending(resource: resource, amount: amountToSave, date: date, price: priceToSave)
                        resourceViewModel.updateMedia(resource)
                        dismiss()
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

func formatMonth(date: Date) -> String {
    let dateFormatter = DateFormatter()
    
    // Definindo o formato para exibir o mês abreviado
    dateFormatter.dateFormat = "MMM"
    
    // Retorna a string do mês abreviado
    return dateFormatter.string(from: date)
}
