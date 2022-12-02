module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.0"

    project_id   = "<PROJECT ID>"
    network_name = "gaurav-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "gaurav-subnet"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "var.region"
        },
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "gaurav-subnet-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ]
}