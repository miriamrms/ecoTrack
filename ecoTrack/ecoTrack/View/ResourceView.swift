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
    var resourceType: Resources
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var showGastoMensalSheet: Bool = false
    @State var showHistorySheet: Bool = false
    @State var quantidadeGasta: String = ""
    @State var valorGasta: String = ""
    
    @StateObject var resourceViewModel: ResourceViewModel = ResourceViewModel(dataSource: .shared)
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 40){
                ZStack{
                    resourceType.cor[1] //Cor do Recurso
                    Image(resourceType.bgImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: width)
                    
                    VStack(){
                        HStack{
                            Image(resourceType.singleIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 27)
                            Text(resourceType.rawValue)
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
                                    Text("1652 \(resourceType.measurement)")
                                }
                                .font(.system(size: 23, weight: .bold))
                                HStack{
                                    Image("coin")
                                    Text("R$657,00")
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
                                        .foregroundColor(resourceType.cor[1])
                                        .padding(.top, 14)
                                        .padding(.bottom, 14)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }
                                .sheet(isPresented: $showHistorySheet) {
                                    HistorySheetView(resourceType: resourceType)
                                        .environmentObject(resourceViewModel)
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
                                        .foregroundColor(resourceType.cor[1])
                                        .padding(.top, 14)
                                        .padding(.bottom, 14)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }
                                .sheet(isPresented: $showGastoMensalSheet) {
                                    GastoMensalSheetView(resource: resourceType)
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
                            AnalysisButtonView(analysis: analysis, resource: resourceType, valor: 0.3)
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
    ResourceView(resourceType: .agua)
//        .environmentObject(ResourceViewModel(dataSource: <#SwiftDataService#>))
}

struct HistorySheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var resourceViewModel: ResourceViewModel
    @State private var selectionYear = "2024"
    @State var isShowingYearPicker = false
    var resourceType: Resources
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
                ForEach(0..<5) { i in
                    HStack {
                        Text("Item \(i)")
                            .font(.system(size: 19, weight: .bold))
                        Spacer()
                        Text("Item \(i)")
                            .font(.system(size: 19, weight: .regular))
                        Spacer()
                        Text("Item \(i)")
                            .font(.system(size: 19, weight: .regular))
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(.azulEscuroDark)
                    
                }
                .foregroundStyle(Color.azulEscuroDark)
                
                
                ForEach(resourceViewModel.resources, id: \.id) { r in
                    Text(r.type.rawValue)
                    Text("\(r.history)")
                }
                .foregroundStyle(Color.black)
                
                
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
    @EnvironmentObject var resourceViewModel: ResourceViewModel
    @Environment(\.dismiss) var dismiss
    @State var date = Date.now
    @State var amount: Double?
    @State var price: Double?
    var resource: Resources
    var body: some View {
        
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
        
        NavigationStack {
            Form{
                Text("Adicionar um Gasto de \(resource.rawValue)")
                Section{
                    TextField("Quanditade gasta em \(resource.measurement)", value: $amount, formatter: formatter)
                    TextField("Valor gasto em R$", value: $price, formatter: formatter)
                    DatePicker("Data", selection: $date, displayedComponents: .date)
                }
            }
            .foregroundStyle(Color.verdeEscuroDark)
            .navigationTitle("Novo Gasto | \(resource.rawValue)")
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
//                        resourceViewModel.addSpending(type: resource, amount: amountToSave, date: date, price: priceToSave)
                       
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}
