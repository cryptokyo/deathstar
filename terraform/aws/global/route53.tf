resource "aws_route53_zone" "cryptokyo" {
  name = "cryp.tokyo"
}

resource "aws_route53_record" "cryptokyo" {
  zone_id = "${aws_route53_zone.cryptokyo.zone_id}"
  name    = "cryp.tokyo"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.cryptokyo.website_domain}"
    zone_id                = "${aws_s3_bucket.cryptokyo.hosted_zone_id}"
    evaluate_target_health = false
  }
}
