# Overview

This charm provides [HAProxy][haproxy]. HAProxy describes itself as a free, very
fast and reliable solution offering high availability, load balancing, and
proxying for TCP and HTTP-based applications. It is particularly suited for very
high traffic web sites and powers quite a number of the world's most visited
ones. Over the years it has become the de-facto standard opensource load
balancer, is now shipped with most mainstream Linux distributions, and is often
deployed by default in cloud platforms. Since it does not advertise itself, we
only know it's used when the admins report it :-) 

# Usage

To deploy:

    juju deploy cs:~chris.sanders/haproxy

You will most likely want to use a bundle to set options during deployment. The
primary use case for this charm is to allow other chamrs that implement the
[reverse-proxy][interface-reverseproxy] interface to automatically register for
reverse proxy. This charm will allow both http and tcp reverse proxy's to be
requested from other charms. Addationally, for http reverse proxy Letsencrypt is
provided to allow HAProxy to automatically register for a certificate and
terminate the SSL/TLS connection. Finally, this charm provides options to use
UPNP for automaticly requesting ports via UPNP. Most of these featuers are off
by default, see the configuration options to enable them.

## Known Limitations and Issues

This charm is under development, several other usecases/features are still under
consideration. Merge requests are certinaly appreciated, some examples of
current limitations include.

 * No way to configure reverseproxy for non-charmed services
 * No HA Failover or Scaleout usage currently implented
 * Can not restrict the ports other charms request
 * Unit/Functional testing is not yet implemented

# Configuration

See the full list of configuration options below. This will detail some of the
options that are worth highlighting.

 - Version: This is tested at the deafult '1.7', it is intended to provide a way
   to specify a different repository version. In theory if new versions are
   backwards compatible chaning this is all that will be needed for new
   releases.
 - To access HAProxy stats please see "stats-user", "stats-passwd", "stats-url",
   "stats-port", and "stats-local" configuration settings. Note that the stats
   port must be unique, if you want to use the default port of 9000 for other
   service you should change this setting.
 - UPNP is provided via monkey patch and should be considered a convinence.
   Running UPNP in production is not recommended practice.
 - hostname will allow you to customize the hostname of HAProxy, be aware that
   doing this can cause multiple hosts to have the same hostname if you scale
   out the number of units.

# Contact Information

## Upstream Project Information

  - Code: https://github.com/chris-sanders/layer-haproxy 
  - Bug tracking: https://github.com/chris-sanders/layer-haproxy/issues
  - Contact information: sanders.chris@gmail.com

[haproxy]: http://www.haproxy.org/
[interface-reverseproxy]: https://github.com/chris-sanders/interface-reverseproxy

