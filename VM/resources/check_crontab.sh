if md5sum -c cron_fingerprint; then
	echo "/etc/crontab is unchanged"
else
	echo "/etc/crontab was modified on your server" | mail -s "/etc/crontab was modified on your server" root
fi
md5sum /etc/crontab > cron_fingerprint

