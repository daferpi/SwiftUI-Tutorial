//
//  ContentView.swift
//  iOSConferences
//
//  Created by Abel Fernandez Pineiro on 11/10/2020.
//  Copyright © 2020 daferpi. All rights reserved.
//

import SwiftUI

struct ConferenceListView: View {
    var body: some View {

        NavigationView {
            List(conferencesData) { conference in
                VStack(alignment: .leading) {
                    Text(conference.name).font(.headline)
                    Text(conference.location).font(.subheadline)
                }
            }.navigationBarTitle("Conferences")
        }
    }
}

class ConferenceList_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceListView()
    }

    #if DEBUG
        @objc class func injected() {
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ConferenceListView())
        }
    #endif
}
