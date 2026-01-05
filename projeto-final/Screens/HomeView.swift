import SwiftUI
import CoreData
import FirebaseAuth

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoItem.createdAt, ascending: true)],
        predicate: NSPredicate(format: "isDone == %@", NSNumber(value: false)),
        animation: .default
    )
    private var items: FetchedResults<TodoItem>

    @State private var showingAddSheet = false

    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    Text("Nenhuma tarefa aqui. Adicione uma!")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(items) { item in
                            HStack {
                                // Checkbox button
                                Button(action: {
                                    complete(item)
                                }) {
                                    Image(systemName: "square")
                                        .font(.title2)
                                }
                                .buttonStyle(BorderlessButtonStyle())

                                VStack(alignment: .leading) {
                                    Text(item.title ?? "???")
                                        .font(.headline)
                                    Text(item.desc ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("TODO List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sair") {
                        signOut()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddSheet = true
                    }) {
                        Label("Nova tarefa", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddItemView()
            }
        }
    }

    private func complete(_ item: TodoItem) {
        withAnimation {
            item.isDone = true
            saveContext()
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da tarefa")) {
                    TextField("Título", text: $title)
                    TextField("Descrição", text: $description)
                }
            }
            .navigationTitle("Nova tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        addItem()
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = TodoItem(context: viewContext)
            newItem.createdAt = Date()
            newItem.title = title
            newItem.desc = description
            newItem.isDone = false

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
