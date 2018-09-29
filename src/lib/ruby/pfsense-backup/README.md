# pfSense-backup

https://github.com/Win2ix/pfsense-backup

Simple program to download pfSense's configuration using SSH.

## Usage
```
Usage: ./pfsense-backup [options] servers

    -u, --username (username)        Defaults to current user
    -k, --key (ssh key)              Defaults to ~/.ssh/id_rsa or ~/.ssh/id_dsa
    -p, --port (ssh port)            Defaults to 22
    -d, --dir (output directory)     Defaults to current directory
    -h, --help                       Show this help
```

Multiple servers can be specified.
```sh
./pfsense-backup servername1 servername2 servername3
```


## Installation

pfSense-backup uses the `net-scp` and `highline` gems.  If you have Bundler,
simply running `bundle install` should work.  Otherwise, install them with `gem`:
```
gem install net-scp
gem install highline
```

For older Linux distributions still using Ruby 1.8 (i.e. Ubuntu Lucid), you
might be able to install these gems through the package manager.

In Lucid, for example:
```
apt-get install libhighline-ruby libnet-scp-ruby
```

### License

Copyright (c) 2015, Win2ix Systems Inc
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
