# Set up a proxy server to pass github webhooks to jenkins

states:
  jenkins-webhook.server: true


jenkins-webhook:
  server:
    port: 8082
  jenkins:
    host: localhost
    port: 8080
    user: rxia
    api_token: 7cbc80a103303232e998882ebb9100ad
    job_token: MyI3d9kLT0SaL1Ay3i96Kg