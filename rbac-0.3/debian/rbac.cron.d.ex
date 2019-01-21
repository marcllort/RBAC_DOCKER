#
# Regular cron jobs for the rbac package
#
0 4	* * *	root	[ -x /usr/bin/rbac_maintenance ] && /usr/bin/rbac_maintenance
