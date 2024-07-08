data "template_file" "openapi" {
  template = "${file("../../../docs/open_api/sample_api.yaml")}"

  vars = {
    vpc_link = aws_api_gateway_vpc_link.vpclink.id
    nlb_uri  = "http://${aws_lb.nlb.dns_name}"
  }
}

resource "aws_api_gateway_rest_api" "api" {
  name = "test_api"
  body = data.template_file.openapi.rendered

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  lifecycle {
    ignore_changes = [
      policy
    ]
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on  = [aws_api_gateway_rest_api.api]
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "dev"

  triggers = {
    redeployment = sha1(file("../../../docs/open_api/sample_api.yaml"))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_domain_name" "domain" {
  domain_name              = "api.marumo.classmethod.info"
  regional_certificate_arn = aws_acm_certificate_validation.retrieval.certificate_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_base_path_mapping" "base_path" {
  depends_on  = [aws_api_gateway_deployment.deployment]
  api_id      = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_deployment.deployment.stage_name
  domain_name = aws_api_gateway_domain_name.domain.domain_name
}
