locals {
  subnet_ids     = var.subnet_ids
  vpc_id         = var.vpc_id
  vpc_cidr_range = var.vpc_cidr_range
}

module "opensearch_security_group" {
  source                              = "OT-CLOUD-KIT/security-groups/aws"
  version                             = "1.0.0"
  name_sg                             = var.sg_name
  tags                                = var.tags
  enable_whitelist_ip                 = var.enable_whitelist_ip
  enable_source_security_group_entry  = var.enable_source_security_group_entry
  create_outbound_rule_with_src_sg_id = var.create_outbound_rule_with_src_sg_id

  vpc_id = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "opening port 80 for vpc  cidr"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = [local.vpc_cidr_range]
          source_SG_ID = []
        },
        {
          description  = "opening port 443 for vpc cidr"
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = [local.vpc_cidr_range]
          source_SG_ID = []
        }
      ]
    }
  }
}

module "opensearch" {
  source  = "OT-CLOUD-KIT/opensearch/aws"
  version = "0.0.1"
  vpc_options = [{
    subnet_ids         = local.subnet_ids
    security_group_ids = [module.opensearch_security_group.sg_id]
  }]
  name                             = var.name
  tags                             = var.tags
  acm_certificate_domain           = var.acm_certificate_domain
  statuses                         = var.statuses
  domain                           = var.domain
  elasticsearch_version            = var.elasticsearch_version
  availability_zones               = var.availability_zones
  instance_count                   = var.instance_count
  instance_type                    = var.instance_type
  zone_awareness_enabled           = var.zone_awareness_enabled
  master_instance_count            = var.master_instance_count
  master_instance_type             = var.master_instance_type
  warm_instance_count              = var.warm_instance_count
  warm_instance_type               = var.warm_instance_type
  ebs_enabled                      = var.ebs_enabled
  volume_size                      = var.volume_size
  volume_type                      = var.volume_type
  iops                             = var.iops
  automated_snapshot_start_hour    = var.automated_snapshot_start_hour
  enforce_https                    = var.enforce_https
  tls_security_policy              = var.tls_security_policy
  node_to_node_encryption          = var.node_to_node_encryption
  encrypt_at_rest                  = var.encrypt_at_rest
  advanced_security_options_enable = var.advanced_security_options_enable
  internal_user_database_enabled   = var.internal_user_database_enabled
  master_user_options = [{
    master_user_name     = var.master_user_name
    master_user_password = var.master_user_password
  }]
}
