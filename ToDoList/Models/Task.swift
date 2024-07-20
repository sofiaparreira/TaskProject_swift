//
//  Task.swift
//  ToDoList
//
//  Created by Sofia on 16/07/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}

// Inicialização correta da variável tasks
var tasks: [Task] = [
    Task(title: "Fazer café"),
    Task(title: "Trabalhar", description: "Terminar o site do trabalho"),
    Task(title: "Estudar para a prova")
]
