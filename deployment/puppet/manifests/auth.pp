
class auth{

  ssh_authorized_key {
    "jacobo@hara.local":
      ensure  => present,
      user    => root,
      type    => "ssh-rsa",
      key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDtUBlDsbYfk5Kdo3/YBrumK92X6QRKKPL7lmZ0tz0g6y2ooFdh71Y+zKRdmRm2k0tqgqI/PGkI3o5kS41paRpMHJuGFQTpBRkWvG1bHEvSZpGW1BlGsCX8pntLTwCAf65fLQqNBbzcJrZXoFLng3oRrd5SBA4uEA6Qv4lzLQXgGsLd9mKjpGgbNYIvQlJ07bSjUuEmJZZlPQ3OHCGgPoV7lw64Zv+MQWFnzVvVR4jb9MiJKd4H90GMXkO3PHIkusBp+njeIz0lK+QD78SRyR5Ax19YaF5MRc+FhjADlr077GkX7EpghxdGeop1zpnk2GmKZBTjyE0dX7chFrhUMKW1";

    "jacobo@ginza.local":
      ensure  => present,
      user    => root,
      type    => "ssh-rsa",
      key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDIU3Yg1/tbBUKquHSoWtsQUp93YMGssVnQbtW8RbSN/Uomv8qddcQFsZ5ObOCK06SUfxN7m9JFF3ICSRGpozRM9QTlyg0A5WfYC2A5Dpd86nLfzMcZjjA2+tEpObBk8TBJiZxy2CTqxX32AfP3yzGzMSXiTx0rGICCc2yzbNQAg81gRdF1m3pGK0tpLrp9Y5Atx8xnLlDC9ILOOvqHglHxSEzExXPJWmYxg9VINdsHHifYQF3Rszf/xnrP6GYuEf0rWFk1/ELkmhqh887Xh0K+Od8Zr5xqg7fBbYeCXPs2VptDZ2rbsd40exffqRd5QIVZz76aElff3UzOM4QPZLuj";
  }

  file {
    "/root/.ssh/":
    path    => "/root/.ssh/",
    ensure  => directory,
    mode    => 700,
    owner   => root,
    group   => root;

    "/root/.ssh/authorized_keys":
    path    => "/root/.ssh/authorized_keys",
    mode    => 600,
    owner   => root,
    group   => root;
  }

}