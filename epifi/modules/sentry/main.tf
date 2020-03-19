resource "aws_instance" "upgrade-prod-app" {
  count = 2
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [
    var.sg1,
    var.sg2]
  subnet_id = var.subnet_id
  key_name = var.key_pair
  iam_instance_profile = "production"

  root_block_device {
    volume_type = "gp2"
    volume_size = "150"
    delete_on_termination = "false"
  }

  tags = {

    Name = "sentri-app"
    Environment = "Prod"
    Layer = "App"
    Deploy = "True"

  }

  user_data = "${file("userdata.sh")}}"
}
