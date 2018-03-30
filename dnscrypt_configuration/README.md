DNSCrypt configuration on LEDE
DNSCrypt offers a way to protect clients against attacks related to the modification and manipulation of DNS traffic.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
opkg update
opkg install dnscrypt-proxy
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
/etc/init.d/dnscrypt-proxy enable
/etc/init.d/dnscrypt-proxy start
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#### Edit /etc/config/dhcp ############

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
config dnsmasq
        option domainneeded '1'
        option boguspriv '1'
        option filterwin2k '0'
        option localise_queries '1'
        option rebind_protection '1'
        option rebind_localhost '1'
        option local '/lan/'
        option domain 'lan'
        option expandhosts '1'
        option nonegcache '0'
        option authoritative '1'
        option readethers '1'
        option noresolv '1' # VERY IMPORTANT CONFIG LINE!
        option leasefile '/tmp/dhcp.leases'
        list server                 '127.0.0.1#5353'
        list server                 '/pool.ntp.org/208.67.222.222'
#        option resolvfile '/tmp/resolv.conf.auto'
        option localservice '1'
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

##### edit /etc/config/dnscrypt-proxy

	option resolver 'ventricle.us'    ----->   put the server from measure
	
#####

/etc/init.d/dnsmasq restart

#####


An easy fix is to switch to another server (e.g. “cisco”), but depending on your location, “cisco” might not be the fastest choice. And since you want DNS requests to be resolved quickly, you need to measure which servers provide you with the best options. A quick search on the internet showed that we’re in luck - Christian Hermann (https://github.com/bitbeans8) had posted a nice little tool to measure connections to all the DNS severs in the DNSCrypt’s csv-file and report them back with all the metrics: https://github.com/bitbeans/dnscrypt-measurement19
Not only it reports the fastest servers first, it also provides all important metrics for those servers, so you can pick what you’re comfortable with: NoLogs, DNSSEC, Valid Certificate

The only downside of this nifty utility is that you need Windows machine to run it. :slight_smile:

For me, the “Anatomical DNS, NoLogs: True, DNSSEC: True, Certificate Valid: True” was the best choice.