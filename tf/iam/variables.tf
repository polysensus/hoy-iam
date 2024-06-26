variable "project_id" {
    type = string
}

variable "project_name" {
    type = string
}

variable "polysensus_org_id" {
    type = string
}

variable "polysensus_billing_account" {
    type = string
}

variable "polysensus_git_auth_client_id" {
    type = string
}

variable "logsink_project_id" {
    type = string
}

variable "cluster_name" {
    type = string
}

variable "cluster_location" {
    type = string
}

variable "cluster_region" {
    type = string
    default = "europe-west2"
}

variable "cluster_project_id" {
    type = string
}

variable "firestore_service_namespace" {
    type = string
}

variable "firestore_root_collection" {
    type = string
}
