##todos:

* in Vagrant, anytime things shut down and restart, postgres starts a cluster from /var/pgsql/data (deleted!), when the one I want happening is at $PGDATA=/usr/local/pgsql/data/

* users should be verified: look to sorcery mailer to see how that goes

* if created users aren't valid, don't redraw index

* when using guard with vagrant, file-updates aren't detected, so you need to have guard poll for changes: guard -p -l 10 (numbers < 10 are more frequent, more cpu)

* letter-opener doesn't work with a VM: in that case, use http://mailcatcher.me