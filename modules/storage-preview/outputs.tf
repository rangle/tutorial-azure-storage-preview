output "primary_web_endpoint"{
  value = "${lookup(data.external.fetch_primary_web_endpoint.result, "endpoint")}"
}
