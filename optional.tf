variable "name" {
  description = "Name of the virtual gateway. Will default to product if not defined."
  default     = null
  type        = string
}

variable "port" {
  description = "Port the router will listen on"
  default     = 80
  type        = number
}

variable "protocol" {
  description = "Protocol the router will listen with"
  default     = "http"
  type        = string
}
