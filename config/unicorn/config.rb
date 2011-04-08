UNICORN_CONFIG = {
  development: {
    port:    8080,
    workers: 2,
    pidfile: '/tmp/unicorn-battle.pid',
  },
  production: {
    port:    [ 6001, 6002, 6003, 6004 ],
    pidfile: '/tmp/unicorn-battle.pid',
    stderr:  '/tmp/unicorn-battle.stderr.log',
    stdout:  '/tmp/unicorn-battle.stdout.log',
  },
}
