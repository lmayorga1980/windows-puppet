wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz
gzip -d ruby-2.0.0-p451.tar.gz
tar xvf ruby-2.0.0-p451.tar
cd ruby-2.0.0-p451 && ./configure && make install 
