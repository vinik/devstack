
provider "openstack" {
    user_name  = "admin"
    tenant_name = "admin"
    password  = "secret"
    auth_url  = "http://127.0.0.1:5000/v2.0"
}


resource "openstack_compute_floatingip_v2" "floatip_1" {
  region = ""
  pool = "public"
}
