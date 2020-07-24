variable "aws_key_path" {
  default = "/home/usuario/Descargas/fm-canada.pem"
}

variable "aws_key_name" {
  default = "fmr-canada"
}

variable "aws_region" {
  description = "Región EC2 para la VPC"
  default     = "ca-central-1"
}

variable "amis" {
  description = "AMIs por region"
  default = {
    ca-central-1 = "ami-0346ee471bb2c892a"
  }
}

variable "vpc_cidr" {
  description = "CIDR para toda la VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR para la subred Public"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR para la subred Private"
  default     = "10.0.1.0/24"
}

