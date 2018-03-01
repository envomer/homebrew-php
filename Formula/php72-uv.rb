require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Uv < AbstractPhp72Extension
  init
  desc "interface to libuv library"
  homepage "https://github.com/bwoebi/php-uv"
  url "https://github.com/bwoebi/php-uv/archive/v0.1.1.tar.gz"
  sha256 "e576df44997a0b656deb4a1c2bfd1879fb3647419b0724bd6e87c7ddf997e2c1"
  head "https://github.com/bwoebi/php-uv.git"
  revision 1

  depends_on "libuv"

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-uv=#{Formula["libuv"].opt_prefix}"
    system "make"
    prefix.install "modules/uv.so"
    write_config_file if build.with? "config-file"
  end
end
