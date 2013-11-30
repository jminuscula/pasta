from fabric.api import task, run
from fabric.context_managers import cd
from fabtools.vagrant import vagrant
from fabtools.python import virtualenv


VAGRANT_HOME = "/opt/pasta"
VIRTUALENV = "/pasta"


@task
def update():
    vagrant()
    with cd(VAGRANT_HOME):
        run('hg pull -u')


@task
def status():
    vagrant()
    run('sudo service couchdb status')
    run('sudo service nginx status')
    with cd(VAGRANT_HOME):
        run('hg status')
