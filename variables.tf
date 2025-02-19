variable "vsphere_user" {
  description = "vSphere user"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "datacenter" {
  description = "The name of the datacenter where the VMs will be deployed"
  type        = string
}

variable "datastore" {
  description = "The name of the datastore where the VMs will be stored"
  type        = string
}

variable "resource_pool" {
  description = "The name of the resource pool for the VMs"
  type        = string
}

variable "cluster" {
  description = "The name of the vSphere cluster for the VMs"
  type        = string
}

variable "network" {
  description = "The network name for the VMs"
  type        = string
}

variable "template" {
  description = "The template used for VM cloning"
  type        = string
}

variable "vm_cpu" {
  description = "Number of CPUs per VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory size per VM in GB"
  type        = number
  default     = 4
}

variable "vm_disk_size" {
  description = "Disk size per VM in GB"
  type        = number
  default     = 50
}

variable "vm_domain" {
  description = "The DNS domain for the VMs"
  type        = string
  default     = "gym.lan"
}

variable "vm_dns_list" {
  description = "List of DNS servers"
  type        = list(string)
}

variable "vm_suffix_list" {
  description = "List of DNS search domains"
  type        = list(string)
}

variable "vm_folder" {
  description = "The folder in vSphere where the VMs will be placed"
  type        = string
}

variable "os_type" {
  description = "The OS type of the VMs (windows or linux)"
  type        = string
}

variable "vm_names" {
  description = "A list of VM names"
  type        = list(string)
}

variable "vm_ips" {
  description = "A list of IP addresses for the VMs"
  type        = list(string)
}

variable "vm_netmasks" {
  description = "A list of netmasks for the VMs"
  type        = list(string)
}

variable "vm_gateways" {
  description = "A list of gateways for the VMs"
  type        = list(string)
}
