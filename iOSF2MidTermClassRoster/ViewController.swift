/* -----------------------------------------------------------------------------
//  FileName: ViewController.swift           02.A
//   Project: iOSF2MidTermClassRoster
//
//  Created by Gru on 11/05/14.
//  Copyright (c) 2014 Gru/CodeFellows. All rights reserved.
//
//  02.A - Implement a custom UIViewController subclass w/ the following functionality
//  02.B - A property that's type is an array of Person objects
//  02.C - A method that created 5+ Person instatnces, 'creatPeople()' and adds
//         them to the array, 'names'
//  02.D - An outlet for a label that is placed on the view controller in the
//         'storyboard'
//  02.E - Two buttons placed on the 'storyboard' below the label, on that says
//         'LEFT' and one that has 'RIGHT'
//  02.F - Each button should be hooked up to an action called. One is called
//         'moveLeft' and the other, 'moveRight'
//  02.G - Design a way that when the buttons are pressed, a first of a person
//         object in the 'PERSON' array is displayed on the label. Pressing
//         'RIGTH' button should cause the next person's name to appear in the
//         lable and 'LEFT' should show the previous name in the array.
// -----------------------------------------------------------------------------
// */

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //  02.D
    @IBOutlet weak var tableView: UITableView!

    var names           = [Person]()        // 02.B
    var    row : Int    = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Art 101 Roster - Fall 2014"

        createPeople()

        self.tableView.dataSource = self
        self.tableView.delegate   = self

        let lists = ["Save","Quit"]

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.names.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as UITableViewCell

        var personToDisplay = self.names[indexPath.row]
        cell.textLabel?.text = personToDisplay.getFullName()

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("segue -> \(segue)")
        println("segue -> \(segue.identifier)")
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass : Person = self.names[selectedIndexPath!.row]
            println( "personToPass -> lastName[\(personToPass.lastName)]")
            println( "personToPass -> firstName[\(personToPass.firstName)]")
            println( "personToPass -> isStudent[\(personToPass.isStudent)]")
            // detailViewController.selectedPerson.setLastName( personToPass.lastName ) //= personToPass
            detailViewController.selectedPerson = personToPass
        }
    }

    //  02.C
    func createPeople() {
        var person1  : Person = Person(firstName: "Vasilij Vasil'evic'",  lastName: "Kandinsky", isStudent: false)
        var person2  : Person = Person(firstName: "Salvador Domingo Felipe Jacinto", lastName: "Dali", isStudent: false)
        var person3  : Person = Person(firstName: "Pablo Diego Jose", lastName: "Picasso", isStudent: false)
        var person4  : Person = Person(firstName: "Umberto" , lastName: "Boccioni", isStudent: true)
        var person5  : Person = Person(firstName: "Paul", lastName: "Klee", isStudent: false)
        var person6  : Person = Person(firstName: "Gustav", lastName: "Klimt", isStudent: true)
        var person7  : Person = Person(firstName: "Henri-Emile-Benoit", lastName: "Matisse", isStudent: false)
        var person8  : Person = Person(firstName: "Joan Miro Ferra", lastName: "Miro", isStudent: false)
        var person9  : Person = Person(firstName: "Pieter Cornelis", lastName: "Mondriaan", isStudent: false)
        var person10 : Person = Person(firstName: "Jackson", lastName: "Polock", isStudent: false)


        addAPerson( person1 )
        addAPerson( person2 )
        addAPerson( person3 )
        addAPerson( person4 )
        addAPerson( person5 )
        addAPerson( person6 )
        addAPerson( person7 )
        addAPerson( person8 )
        addAPerson( person9 )
        addAPerson( person10 )


        println("Created \(self.names.count) new 'names' in the 'PERSON' class")
    }

    func addAPerson( person : Person ) {
        names.append( person )
        println( person.getFullName() )
    }

    /* 02.E, 02.F, 02.G  Code has been commented out ....  for Day 3


    //  02.E/F Go Left Button
    @IBAction func moveLeft(sender: AnyObject) {

    if currentIndex - 1 == -1  {
    currentIndex    = persons.count - 1
    } else {
    currentIndex = currentIndex - 1
    }
    personName.text = persons[currentIndex].getFullName()
    println("Left Button, currentIndex: \(currentIndex)")
    }

    //  02.E/F Go Right Button
    @IBAction func moveRight(sender: AnyObject) {

    if currentIndex >= persons.count - 1 {
    currentIndex = 0
    } else {
    currentIndex = currentIndex + 1
    }
    personName.text = persons[currentIndex].getFullName()
    println("Right Button, currentIndex: \(currentIndex)")
    }
    */
}


