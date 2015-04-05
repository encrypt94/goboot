# goboot

A toy 32 bit kernel written in Go.

Obviously it's the Go version of [rustboot](https://github.com/charliesome/rustboot), basically it paints the screen light blue then hangs. That's it:

![](http://i.imgur.com/60ggYUo.png)

## Build

Requirements:

  * gccgo
  * qemu
  * nasm

```sh
$ make
$ make boot

```

If you're on a 64-bit host you may need to [build the gccgo cross-compiler](https://github.com/golang/go/wiki/GccgoCrossCompilation).
Otherwise, if you're a lazy guy that want to test goboot quickly you can build it on a 32 bit virtual machine using Vagrant.

```sh
$ vagrant up
$ vagrant ssh
vagrant$ cd goboot
vagrant$ make
vagrant$ exit
$ make boot

```

## Interesting projects

* https://github.com/charliesome/rustboot
  * https://github.com/thesam/rustboot/
* https://github.com/tgascoigne/goose