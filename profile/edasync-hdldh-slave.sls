# Profile for the host that is the slave for syncing the eda
# tools required by HDL DH contractors

{% set tardisip = salt['dnsutil.A']('tardis.internal.sifive.com')[0] %}

# Private key is in secret/edasync-hdldh-key.sls
sfaccount:
  users:
    eda:
      authorized_keys:
        - from="{{tardisip}}",restrict ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKHNmTlpGGvAXZQCkNsEkPC3rBbzDQOvlnq0Ze7QTprWis1ynVE85h/tTqf4/xl72WnjRm3Batl9i6oHlmgJVrg9c0o35gB1xEN8KrygOZ6hwQPAwQEdv71bIDpQKh1fIKGzTyImteQBVs/6IgYhVQvEprYPzPaYiGEFAP0XHup6NWerBa0ux0I1EGv4dqJRUVczg/X6+XCXRuny8aBcf5ko2jCtR802n2muZgGAKJ0hy6pOZtiQ/fEl1kjUnBuOUYur4iCP6OAH3uuSpa1Xmdcwzjhe+npLKdoydVlUbt32jelOUmeAhorAjnqltvZX+gUqDKsQw2DX6C2Oc71hPp davidj@Davids-MacBook-Pro.local ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaEdvm0FBkULIlcKYzUk36tGCpvvAY5KdyJdKg/5Xd+ihmSEacpZBTKcfS/r5tHfAPR58d4j+j/A1iichcnTuKhcQm8a4M/qn6hiHOV80L/WUNQzIrE65t+sN80n36ixFBOV5nu1q+QULleHE3VYO4Yiof7rOHs6YH20q40LtbcEBJewoMh/V4CpN1bRP2P61LePzySKhMX2D9iFwZiWT3QNTfBeyAu/7q9nRvK+wp8fdFaO6GRH/PlGlqhJey7sx88HFFUcbVgfwHnWnKnQUuDJlZrx/BFOU+lJtgFWkQbj3XjtDvlMxsB0qDa03z9E+AX0qHkZagvf/O7FTkJjf7 vito.burggraf@sifive.com

# Rely on sshd to control access
pam:
  access:
    eda: ALL
