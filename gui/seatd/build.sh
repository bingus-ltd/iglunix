pkgname=seatd
pkgver=0.6.3

fetch() {
	curl "https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
	mkdir $pkgname-$pkgver/build
}

build() {
	cd $pkgname-$pkgver
	cd build
	meson .. \
		--buildtype=release \
		--prefix=/usr \
		--libexecdir=lib \
		-Dexamples=disabled \
		-Dc_args=-Wno-sign-compare
	samu
}

package() {
	cd $pkgname-$pkgver
	cd build
	DESTDIR=$pkgdir samu install
}

backup() {
    return
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
#	cat COPYING
}
