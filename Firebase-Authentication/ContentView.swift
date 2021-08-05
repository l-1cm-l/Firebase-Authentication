import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject private var authState = FirebaseAuthStateObserver()
    @State var isShowSheet = false

    var body: some View {
        VStack {
            if authState.isSignin {
                Text("You are logined.")
                    .padding()
                Button("logout") {
                    try! Auth.auth().signOut()
                }
            }
            else {
                Text("You are not logged in.")
                    .padding()
                Button("login") {
                    isShowSheet.toggle()
                }
            }
        }
        .sheet(isPresented: $isShowSheet, content: {
            FirebaseUIView()
        })
    }
}
