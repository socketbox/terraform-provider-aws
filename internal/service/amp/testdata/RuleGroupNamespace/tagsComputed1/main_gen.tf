# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "null" {}

resource "aws_prometheus_workspace" "demo" {
}

resource "aws_prometheus_rule_group_namespace" "demo" {
  name         = "rules"
  workspace_id = aws_prometheus_workspace.demo.id

  tags = {
    (var.unknownTagKey) = null_resource.test.id
  }
  data         = <<EOF
groups:
  - name: test
    rules:
    - record: metric:recording_rule
      expr: avg(rate(container_cpu_usage_seconds_total[5m]))
EOF
}

resource "null_resource" "test" {}

variable "rName" {
  description = "Name for resource"
  type        = string
  nullable    = false
}

variable "unknownTagKey" {
  type     = string
  nullable = false
}
