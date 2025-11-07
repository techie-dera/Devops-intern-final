job "hello" {
  datacenters = ["dc1"]

  group "hello-group" {
    task "hello-task" {
      driver = "docker"

      config {
        image = "hello-devops:latest"
        network_mode = "bridge"
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
