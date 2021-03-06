application: @MS_APP_NAME@
version: 1
runtime: python27
api_version: 1
threadsafe: yes

inbound_services:
- warmup

builtins:
- appstats: on
- admin_redirect: on
- deferred: on

handlers:
- url: /cron.*
  script: cron.app
  login: admin

- url: /CERT.*
  script: msapp.app
  secure: always

- url: /USER.*
  script: msapp.app
  secure: always

- url: /VOLUME.*
  script: msapp.app
  secure: always

- url: .*
  script: msapp.app
  secure: never

libraries:
- name: webapp2
  version: "2.5.2"
- name: lxml
  version: latest
- name: pycrypto
  version: latest
- name: django
  version: 1.4

env_variables:
  MS_APP_PUBLIC_HOST: '@MS_APP_PUBLIC_HOST@'
  MS_APP_ADMIN_EMAIL: '@MS_APP_ADMIN_EMAIL@'
  MS_APP_ADMIN_PUBLIC_KEY: |
    @MS_APP_ADMIN_PUBLIC_KEY@
  MS_APP_PUBLIC_KEY: |
    @MS_APP_PUBLIC_KEY@
  MS_APP_PRIVATE_KEY: |
    @MS_APP_PRIVATE_KEY@

