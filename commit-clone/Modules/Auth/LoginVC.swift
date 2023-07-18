//
//  LoginVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 18.07.2023.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase


class LoginVC: GenericVC<LoginView> & Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        
    }
    
}

extension LoginVC: LoginViewDelegate {
    func loginButtonPressed() {
        let user = Auth.auth().currentUser
        
        if user != nil {
//            do {
//              try Auth.auth().signOut()
//            } catch let signOutError as NSError {
//              print("Error signing out: %@", signOutError)
//            }
//            print("signed out")
            
        } else {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                    
            let config = GIDConfiguration(clientID: clientID)

            GIDSignIn.sharedInstance.configuration = config
                    
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { signResult, error in
                
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let user = signResult?.user,
                      let idToken = user.idToken else { return }
                
                let accessToken = user.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
                
                
                Auth.auth().signIn(with: credential) { authResult, error in
                    print("auth")
                }
            }
        }
        
        
        
        
        
    }
}


