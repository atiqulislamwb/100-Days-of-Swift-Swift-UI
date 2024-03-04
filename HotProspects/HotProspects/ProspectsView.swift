//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Atiqul Islam on 4/3/24.
//

import SwiftUI
import SwiftData
import CodeScanner



struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
     
        @Environment(\.modelContext) var modelContext
        @Query(sort: \Prospect.name) var prospects: [Prospect]

    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    @State private var isShowingScanner = false
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)

            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
        
    }
    
    
    var body: some View {
        NavigationStack {
       
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button("Scan", systemImage: "qrcode.viewfinder") {
                   isShowingScanner = true
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        
            
        }
        
    }
        init(filter: FilterType) {
            self.filter = filter

            if filter != .none {
                let showContactedOnly = filter == .contacted

                _prospects = Query(filter: #Predicate {
                    $0.isContacted == showContactedOnly
                }, sort: [SortDescriptor(\Prospect.name)])
            }
        }
    //    let showContactedOnly = filter == .contacted
        
    
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
