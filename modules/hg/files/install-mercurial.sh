wget http://mercurial.selenic.com/release/mercurial-2.5.2.tar.gz
gzip -d mercurial-2.5.2.tar.gz
tar xvf mercurial-2.5.2.tar
cd mercurial-2.5.2 && make install PYTHON=/usr/bin/python2.6
