# nginxinc/glog

![Go](https://github.com/nginxinc/glog/workflows/Go/badge.svg)
![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/nginxinc/glog)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang/glog)](https://goreportcard.com/report/github.com/golang/glog)
![GitHub](https://img.shields.io/github/license/nginxinc/glog)

This is a fork of https://github.com/golang/glog

This fork was created with the intention of updating the log header to include the year.

This can be done be setting the flag `-include_year=true` 

Standard log output from glog
```
I0715 11:40:13.688222 77957 controller.go:839] NGINX is ready
```

Updated log output with year included
```
I20220715 11:40:13.688222 77957 controller.go:839] NGINX is ready
```

## Contributions
Contributions to this repo are allowed, but discouraged.
The purpose of this repo is to provide an implementation of glog that will output the year in the log header.

## Development

```
$ make
help                 Show available make targets
test                 Run tests
lint                 Run linter
```

---
## Original README from golang/glog


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
