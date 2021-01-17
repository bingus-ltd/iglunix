pkgver=2.2.10
pkgname=expat
bad=""
ext="dev"

fetch() {
	pkgver_r = $(echo $pkgver | tr '.' '_')
	curl -L https://github.com/libexpat/libexpat/releases/download/R_2_2_10/$pkgname-$pkgver.tar.xz -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	./configure \
		--prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	rm $pkgdir/usr/lib/*.a
	rm $pkgdir/usr/lib/*.la
	rm -r $pkgdir/usr/include
	rm -r $pkgdir/usr/lib/pkgconfig
	rm -r $pkgdir/usr/share
}

package_doc() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	rm -r $pkgdir/usr/bin
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
}
