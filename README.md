[![Go Report Card](https://goreportcard.com/badge/github.com/golang/glog)](https://goreportcard.com/report/github.com/golang/glog)
![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/nginxinc/glog)
![GitHub](https://img.shields.io/github/license/nginxinc/glog)

# glog



Leveled execution logs for Go.

This is an efficient pure Go implementation of leveled logs in the
manner of the open source C++ package [_glog_](https://github.com/google/glog).

By binding methods to booleans it is possible to use the log package without paying the expense of evaluating the arguments to the log. Through the `-vmodule` flag, the package also provides fine-grained
control over logging at the file level.

The comment from `glog.go` introduces the ideas:

Package _glog_ implements logging analogous to the Google-internal C++ INFO/ERROR/V setup.  It provides the functions Info, Warning, Error, Fatal, plus formatting variants such as Infof. It also provides V-style loggingcontrolled by the `-v` and `-vmodule=file=2` flags.
	
Basic examples:

```go
glog.Info("Prepare to repel boarders")
	
glog.Fatalf("Initialization failed: %s", err)
```
	
See the documentation for the V function for an explanation of these examples:

```go
if glog.V(2) {
	glog.Info("Starting transaction...")
}
glog.V(2).Infoln("Processed", nItems, "elements")
```

The repository contains a forked open source version of the log package used inside Google.

## Development

```
$ make
help                 Show available make targets
test                 Run tests
lint                 Run linter
```
