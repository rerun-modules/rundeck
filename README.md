[Rundeck](http://rundeck.org), an operational deployment console, plays a critical role in Continuous Deployment (including automated deployments within a CI loop).  Like any deployed software, configuration and state of your current automation must be maintained.  

This [Rerun](http://rerun.github.com/rerun) module automates standard practice for installation, management and operations of [Rundeck](http://rundeck.org) based on the [Red Hat/CentOS/Fedora](http://repo.rundeck.org/latest.rpm) distribution that results in the instance running as the rundeck user out of /var/lib/rundeck.

The Rundeck instance deployed by the module preserves the default [authentication](http://rundeck.org/docs/administration/authentication.html) and [authorization](http://rundeck.org/docs/administration/authorization.html) access control.

The commands are written with the expectation that they will be run by a non-root user that has sudo(8) access to run a number of commands (listed below).

The module has the ability to deploy and remove the Rundeck  instance as well as managing its operation and configuration.

Additionally, the module can manage the full-lifecyle of individual jobs.

* Use rundeck:deploy and rundeck:remove to create and destroy the Rundeck instance
* Use rundeck:start, rundeck:stop, rundeck:status, rundeck:restart to manage the running Rundeck instance
* Use rundeck:create-job and rundeck:delete-job to manage jobs as XML source
* Use rundeck:run-job to run a rundeck job

Consult README.md in the command and options directories for further description of using these commands.

Requirements
------------

* Internet access to acquire installation RPMs
* A Red Hat/CentOS 5 or 6 instance
* No service running on port 4440 and no firewall blocking that port
* A non-root user that has non-interactive sudo(8) access to run "chmod", "chown", "groupdel", "mv", "rm", "service", "userdel", "yum" commands as the root user (or simply add the user to the "wheel" group and enable carte-blanche access ;-).

Installation
------------
The following instructions describe how to install Rerun itself and the set of modules necessary to use the Rundeck module (and others):

* Install [Rerun](http://rerun.github.com/rerun) itself by obtaining the latest "rerun" RPM package link from [Rerun Downloads](https://github.com/rerun/rerun/downloads) page and executing the following command (replacing example URL):
<pre>
[root@centos62 ~]# rpm -Uvh https://github.com/downloads/rerun/rerun/rerun-1.0-129.noarch.rpm
Retrieving https://github.com/downloads/rerun/rerun/rerun-1.0-129.noarch.rpm
Preparing...                ########################################### [100%]
   1:rerun                  ########################################### [100%]
</pre>

* Install the latest version of the rerun-modules Yum repo definition by obtaining the latest "rerun-modules-repo" (<i>not</i> "rerun-modules-yum-repo")  RPM package link from [Rerun Modules Downloads](https://github.com/rerun-modules/rerun-modules/downloads) and executing the following command (replacing example URL):
<pre>
[root@centos62 ~]# rpm -Uvh https://github.com/downloads/rerun-modules/rerun-modules/rerun-modules-repo-1.0-21.noarch.rpm
Retrieving https://github.com/downloads/rerun-modules/rerun-modules/rerun-modules-repo-1.0-21.noarch.rpm
Preparing...                ########################################### [100%]
   1:rerun-modules-repo     ########################################### [100%]
</pre>

* Install all the latest rerun modules (including this Rundeck module):
<pre>
[root@centos62 ~]# yum -y --disablerepo '*' --enablerepo 'rerun-modules' install '*'
.
.
.
Complete!
</pre>

* Review the available modules. e.g:
<pre>
[root@centos62 ~]# which rerun
/usr/bin/rerun
[root@centos62 ~]# rerun
Available modules in "/usr/lib/rerun/modules":
  apache-maven: "Rerun module to manage the apache-maven distribution"
  github: "Rerun module to manage working with Github"
  jboss-as: "Rerun module to manage working with the JBoss application server"
  jenkins: "Rerun module to manage Jenkins installation, configuration and operations"
  mysql: "Rerun module to manage working with the MySQL database server"
  rpm: "Manage the full life-cycle of RPM packages"
  rundeck: "Rerun module to manage Rundeck installation configuration and operations"
  ssh: "Rerun module for managing secure shell client and server usage"
  stubbs: "Simple rerun module builder"
</pre>

* Note that several commands rely on xmlstarlet(1) which is available for installation from [EPEL](http://fedoraproject.org/wiki/EPEL):
<pre>
[root@centos62 ~]# yum -y install xmlstarlet
.
.
.
Complete!
</pre>
