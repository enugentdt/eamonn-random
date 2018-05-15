yum -y install gcc

mkdir musl-libc
cd musl-libc
wget http://www.musl-libc.org/releases/musl-latest.tar.gz
tar --strip-components=1 -xvf musl-latest.tar.gz
./configure
make
make install
echo "Done!"
