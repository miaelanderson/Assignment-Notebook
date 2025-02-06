//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Mia Anderson on 2/5/25.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "History", "English", "Science", "Physics"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Courses", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate,
                displayedComponents: .date)
            }
                .navigationBarTitle("Add New Assignment", displayMode: .inline)
                .navigationBarItems(trailing: Button("Save") {
                    if course.count > 0, description.count > 0 {
                        let item = AssignmentItem(id: UUID(), course: course,
                            description: description, dueDate: dueDate)
                        assignmentList.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
        }
     }
}

#Preview {
    AddAssignmentView(assignmentList: AssignmentList())
}
