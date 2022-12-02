module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.0"

    project_id   = "var.project"
    network_name = "guarav-network"

    subnets = [
        {
            subnet_name           = "gaurav-subnet"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "var.region"
        },
    ]

}