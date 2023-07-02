variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr_range" {
  description = "CIDR range of the VPC"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "enable_whitelist_ip" {
  description = "Enable IP whitelisting"
  type        = bool
}

variable "enable_source_security_group_entry" {
  description = "Enable source security group entry"
  type        = bool
}

variable "create_outbound_rule_with_src_sg_id" {
  description = "Create outbound rule with source security group ID"
  type        = bool
}

variable "opensearch_name" {
  description = "Name of the OpenSearch domain"
  type        = string
}




variable "domain" {
  description = "OpenSearch domain name"
  type        = string
}

variable "elasticsearch_version" {
  description = "OpenSearch version"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        =  number
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "zone_awareness_enabled" {
  description = "Enable zone awareness"
  type        = bool
}

variable "master_instance_count" {
  description = "Number of master instances"
  type        = number
}

variable "master_instance_type" {
  description = "Master instance type"
  type        = string
}

variable "warm_instance_count" {
  description = "Number of warm instances"
  type        = number
}

variable "warm_instance_type" {
  description = "Warm instance type"
  type        = string
}

variable "ebs_enabled" {
  description = "Enable EBS storage"
  type        = bool
}

variable "volume_size" {
  description = "Size of EBS volume (in GB)"
  type        = number
}

variable "volume_type" {
  description = "Type of EBS volume"
  type        = string
}

variable "iops" {
  description = "IOPS for EBS volume"
  type        = number
}

variable "automated_snapshot_start_hour" {
  description = "Hour for automated snapshots"
  type        = number
}

variable "enforce_https" {
  description = "Enforce HTTPS"
  type        = bool
}

variable "tls_security_policy" {
  description = "TLS security policy"
  type        = string
}

variable "node_to_node_encryption" {
  description = "Enable node-to-node encryption"
  type        = bool
}

variable "encrypt_at_rest" {
  description = "Enable encryption at rest"
  type        = bool
}

variable "advanced_security_options_enable" {
  description = "Enable advanced security options"
  type        = bool
}

variable "internal_user_database_enabled" {
  description = "Enable internal user database"
  type        = bool
}

variable "master_user_name" {
  description = "Master user name"
  type        = string
}

variable "master_user_password" {
  description = "Master user password"
  type        = string
}
