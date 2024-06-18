resource "aws_instance" "this" {
  ami           = "ami-042ede0157c765756"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
