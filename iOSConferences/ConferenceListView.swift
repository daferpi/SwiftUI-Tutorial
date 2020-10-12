//
//  ContentView.swift
//  iOSConferences
//
//  Created by Abel Fernandez Pineiro on 11/10/2020.
//  Copyright © 2020 daferpi. All rights reserved.
//

import SwiftUI

struct ConferenceListView: View {
    @ObservedObject var conferenceLoader = ConferenceLoader()
    var body: some View {

        NavigationView {
            List(conferenceLoader.conferences) { conference in
                NavigationLink(destination: ConferenceDetails(conference: conference)) {
                    VStack(alignment: .leading) {
                        Text(conference.name).font(.headline)
                        Text(conference.location).font(.subheadline)
                    }
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
