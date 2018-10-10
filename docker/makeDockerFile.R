
dockerfile_object <- dockerfile(from = file.path("../tuto.Rmd"),
  silent = TRUE,
  cmd = CMD_Render("../tuto.Rmd"))
print(dockerfile_object)
write(dockerfile_object, file = "Dockerfile")
