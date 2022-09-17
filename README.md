* http://home.tiscali.cz/~cz210552/webbench.html


```bash
$ ./webbench --help
webbench [option]... URL
  -f|--force               Don\'t wait for reply from server.
  -r|--reload              Send reload request - Pragma: no-cache.
  -t|--time <sec>          Run benchmark for <sec> seconds. Default 30.
  -p|--proxy <server:port> Use proxy server for request.
  -c|--clients <n>         Run <n> HTTP clients at once. Default one.
  -9|--http09              Use HTTP/0.9 style requests.
  -1|--http10              Use HTTP/1.0 protocol.
  -2|--http11              Use HTTP/1.1 protocol.
  --get                    Use GET request method.
  --head                   Use HEAD request method.
  --options                Use OPTIONS request method.
  --trace                  Use TRACE request method.
  -?|-h|--help             This information.
  -V|--version             Display program version.



$ ./webbench -f http://www.baidu.com/
args: 3
argv: ./webbench
argv: -f
argv: http://www.baidu.com/


$ ./webbench  http://www.baidu.com/
args: 2
argv: ./webbench
argv: http://www.baidu.com/

```
