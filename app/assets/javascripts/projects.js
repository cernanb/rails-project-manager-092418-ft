$(() => {
  $("#btn").on("click", () => {
    console.log("button was clicked")
    $.get("/projects.json", function(data) {
      console.log(data)
      $("#btn").hide()
      data.forEach(function(project) {
        const newProject = new Project(project)
        newProject.renderToPage()
      })
    })
  })
})

function Project(projectObject) {
  this.name = projectObject.name
  this.tasks = projectObject.tasks
}

Project.prototype.renderToPage = function() {
  $("#projects").append(`<h1>${this.name}</h1>
  ${this.tasks.map(task => <p>${task.title}</p>)}
  `)
}
