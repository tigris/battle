UNICORN_CONFIG = {
  development: {
    port:    8080,
    workers: 2,
    pidfile: '/tmp/unicorn-battle.pid',
  },
  production: {
    socket:  '/var/run/unicorn-battle.sock',
    pidfile: '/var/run/unicorn-battle.pid',
    stderr:  '/var/log/unicorn-battle.stderr.log',
    stdout:  '/var/log/unicorn-battle.stdout.log',
    backlog: 1024,
    workers: 4,
  },
}
