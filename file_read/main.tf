output "file" {
  value = [ for row in split("\n", chomp(file("${path.module}/file/sample.txt"))) : row if !can(regex("//.+",row))]
}