//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Leandro Alves da Silva on 14/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var primeiroNome = ""
    @State private var sobreNome = ""
    @State private var nacimento = Date()
    @State private var receberNoticias = false
    @State private var numeroLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações Pessoais")) {
                    TextField("Nome", text: $primeiroNome)
                    TextField("Sobrenome", text: $sobreNome)
                    DatePicker("Nascimento", selection: $nacimento, displayedComponents: .date)
                }
                Section(header: Text("Preferências")) {
                    Toggle("Receber notícias", isOn: $receberNoticias)//.toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Numero de Likes", value: $numeroLikes, in: 1...100)
                    Text("Numero de likes \(numeroLikes)")
                    Link("Linkedin", destination: URL(string: "https://www.linkedin.com/in/leandro-alves-da-silva-845b7b10a/")!)
                }
            }
            .navigationTitle("Cadastro")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyBoard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Salvar", action: saveUser)
                }
            }
        }
        //.accentColor(.red)
    }
    func saveUser() {
        print("Salvo com sucesso.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
