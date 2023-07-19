function FindProxyForURL(url, host) {
  //proxy = "SOCKS5 127.0.0.1:12345, DIRECT";
  proxy = "SOCKS5 127.0.0.1:12345";
  if (shExpMatch(host, "github.com*")) {
    return proxy;
  }
  if (shExpMatch(host, "artifactory.*")) {
    return proxy;
  }
  if (shExpMatch(host, "*dashboard.sourcevertex.net*")) {
    return proxy;
  }
  if (shExpMatch(host, "grafana.*")) {
    return proxy;
  }
  if (shExpMatch(host, ".*cdash.*")) {
    return proxy;
  }

  return "DIRECT";
}
