# Profile for the host that is the slave for syncing the eda
# tools required by SmartDV contractors

{% set tardisip = salt['dnsutil.A']('tardis.internal.sifive.com') %}

# Private key is in secret/edasync-smartdv-key.sls
sfaccount:
  users:
    eda:
      authorized_keys:
        - from="{{tardisip}}",restrict ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDij5HQx5GxLZbteaI6K+xBZaVf5/l6iDHiOGvhU2dFGArVGDdnNGZQfD/8TPXopKLWZXOuGlyxm5sUd8MVmbUwGccL6Vg0JYd9UnmWpVYvYkaE8rFEKT9dvWXJMb6QZxaPLS7dDdHAh2M+irudq994nrkUrG7DrqJcQ6Gfh3CDubYRqL8eujpagkYRN1Sz0b5nIhaVYilsGwWdw1aj2dQhBlPuKqJ3q9piMxDIx8+oE8NU1H7qYE7q/SIo0bq6tPEWKiWiRJqnKbN1Q5SAfGhX8IcN0/4I9e0kfQ/i6lCTVJP0cTfb5dSm/WKf4gU7TV4wqx6x6Pe9bKtoxKG7NLhd davidj@Davids-MacBook-Pro.local
        