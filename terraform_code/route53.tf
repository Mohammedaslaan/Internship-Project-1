

# # Create a new A record that points to the Load balancer.
# data "aws_route53_zone" "mydomain" {
#   name = "mohammedaslaan.xyz"

# }

# resource "aws_route53_record" "new_record" {
#   zone_id = data.aws_route53_zone.mydomain.zone_id
#   name    = "www.mohammedaslaan.xyz"
#   type    = "A"
#   alias {
#     name                   = aws_lb.terramino.dns_name
#     zone_id                = aws_lb.terramino.zone_id
#     evaluate_target_health = false
# }
# }