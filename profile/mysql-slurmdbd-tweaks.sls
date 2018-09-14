## Tweaks to the mysql config to make slurmdbd work reliably
## Ref: https://bugs.schedmd.com/show_bug.cgi?id=2509


mysql:
  server:
    mysqld:
      # innodb_lock_wait_timeout default 50
      innodb_lock_wait_timeout: 900
      # innodb_log_file_size default 50331648
      innodb_log_file_size: 134217728
      # innodb_buffer_pool_size default 134217728
      innodb_buffer_pool_size: 1073741824
      
