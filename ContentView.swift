//
//  ContentView.swift
//  Zookeeper
//
//  Created by Rodrigo Garcia Olvera on 31/01/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    let animalGroups = [
        AnimalGroup(groupName: "Pets", animals: [
            Animal(name: "Dog"),
            Animal(name: "Cat"),
            Animal(name: "Parrot"),
            Animal(name: "Mouse")
        ]),
        AnimalGroup(groupName: "Farm", animals: [
            Animal(name: "Cow"),
            Animal(name: "Horse"),
            Animal(name: "Goat"),
            Animal(name: "Sheep"),
        ]),
        AnimalGroup(groupName: "Critters", animals: [
            Animal(name: "Firefly"),
            Animal(name: "Spider"),
            Animal(name: "Ant"),
            Animal(name: "Squirrel"),
        ])
    ]
    
    var body: some View {
            List {
                ForEach(animalGroups) { animalGroup in
                    Section(header: Text(animalGroup.groupName)) {
                        ForEach(animalGroup.animals) { animal in
                            Text(animal.name)
                        }
                    }
                }
            }
        }
}

//The first ForEach generates a Section view for each of the AnimalGroup structures in the animalGroups array. The Section view defines a discrete section of the list, which in turn has a nested ForEach that generates the list items for each of the Animal structures in the animal property of its corresponding AnimalGroup. The header of the Section is specified by its header property, which can be any SwiftUI view.

struct Animal: Identifiable {
    var id = UUID()
    var name: String
}
//We have made the Animal structure conform to the Identifiable protocol, which means that it must have a property called id that is a unique identifier. By using an instance of the UUID structure (built into Swift Foundation) we guarantee that id is unique.

struct AnimalGroup: Identifiable {
    var id = UUID()
    var groupName: String
    var animals: [Animal]
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
