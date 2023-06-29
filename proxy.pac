function FindProxyForURL(url, host) {
  proxy = "SOCKS5 127.0.0.1:12345";
  // our local URLs from the domains below example.com don't need a proxy:
  if (shExpMatch(host, "artifactory.*")) {
    return proxy;
  }

  return "DIRECT";
}
