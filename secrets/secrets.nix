let
  yzld2002 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3dHygJrJv/ZqC1Y8NhpghQK4hMTuacdJhcXtvfG7dN yzld2002@gmail.com";
  users = [ yzld2002 ];
in
{
  "dnspod.age".publicKeys = users;
  "vaultwarden.age".publicKeys = users;
}
