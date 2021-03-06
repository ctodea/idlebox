provider "aws" {
  region = "${var.region}"
}

#paperwork, not needed without lb
# resource "aws_iam_role" "ecs-role" {
#   name               = "${var.tier}-jenkins-iam-role"
#   assume_role_policy = "${file("policies/ecs-role.json")}"
# }

# resource "aws_iam_role_policy" "ecs-role-policy" {
#   name   = "${var.tier}-jenkins-iam-role-policy"
#   policy = "${file("policies/ecs-instance-role-policy.json")}"
#   role   = "${aws_iam_role.ecs-role.id}"
# }

#ECS
resource "aws_ecs_cluster" "ecs-jenkins" {
  name = "${var.tier}-${var.ecs_jenkins_cluster}"
}

resource "aws_ecs_task_definition" "ecs-jenkins" {
  family                = "ecs-jenkins"
  container_definitions = "${file("task-definitions/jenkins-container.json")}"
}

resource "aws_ecs_service" "ecs-jenkins" {
  name            = "${var.ecs_jenkins_service}"
  cluster         = "${aws_ecs_cluster.ecs-jenkins.id}"
  task_definition = "${aws_ecs_task_definition.ecs-jenkins.arn}"
  desired_count   = "${var.ecs_jenkins_service_count}"

  #only when using lb/autoscaling
  #iam_role        = "${aws_iam_role.ecs-role.arn}"
  #depends_on      = ["aws_iam_role_policy.ecs-role-policy"]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
}

# resource "aws_instance" "foo" {
#   count           = "${var.foo_instances}"
#   ami             = "${var.foo_ami_id}"
#   instance_type   = "${var.foo_instance_type}"
#   security_groups = ["${aws_security_group.allow_ssh_access.name}"]
# }


# resource "aws_security_group" "allow_ssh_access" {
#   name        = "${var.tier}-${var.sg_ssh_name}"
#   description = "Allow ingress traffic to port 22 for enabling ssh connection"


#   ingress {
#     from_port   = 0
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   tags {
#     tier = "${var.tier}"
#   }
# }


# resource "aws_security_group" "allow_http_access" {
#   name        = "${var.tier}-${var.sg_http_name}"
#   description = "Allow ingress traffic to port 80"


#   ingress {
#     from_port   = 0
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   tags {
#     tier = "${var.tier}"
#   }
# }


# resource "aws_s3_bucket" "buckyMcBucketface" {
#   bucket = "${var.s3_logs_bucket_name}"


#   versioning {
#     enabled = false
#   }


#   tags {
#     tier = "${var.tier}"
#   }
# }


/*
resource "aws_iam_user" "alb" {
  name = "app-loadbalancer"
  path = "/system/"
}


resource "aws_iam_user_policy" "alb_s3" {
  name = "alb-access"
}
*/
# resource "aws_iam_account_password_policy" "strict" {
#   minimum_password_length        = 8
#   require_lowercase_characters   = true
#   require_numbers                = true
#   require_uppercase_characters   = true
#   require_symbols                = true
#   allow_users_to_change_password = true
# }


#TODO
# alb logs 2 s3

