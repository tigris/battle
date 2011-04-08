UNICORN_CONFIG = {
  development: {
    port:    8080,
    workers: 2,
    pidfile: '/tmp/unicorn-battle.pid',
  },
  production: {
    port:    [ 5001, 5002, 5003, 5004 ],
    pidfile: '/tmp/unicorn-battle.pid',
    stderr:  '/tmp/unicorn-battle.stderr.log',
    stdout:  '/tmp/unicorn-battle.stdout.log',
  },
}
