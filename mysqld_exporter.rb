class MysqldExporter < Formula
  desc "Prometheus exporter for MySQL server metrics"
  homepage "https://github.com/prometheus/mysqld_exporter"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/prometheus/mysqld_exporter/releases/download/v0.18.0/mysqld_exporter-0.18.0.darwin-arm64.tar.gz"
    sha256 "b2faa4abd98823ee42a7667fad362dfb00acec57e3ab2d4572ba7e5cf828284b"
  else
    url "https://github.com/prometheus/mysqld_exporter/releases/download/v0.18.0/mysqld_exporter-0.18.0.darwin-amd64.tar.gz"
    sha256 "f136a4159d9cf779ead6d612a76b64922729506256bad1d8360e02a98497f83c"
  end

  def install
    bin.install "mysqld_exporter"
  end

  service do
    run [
      opt_bin/"mysqld_exporter",
      "--config.my-cnf=#{ENV["HOME"]}/.config/mysqld_exporter/.my.cnf"
    ]
    keep_alive true
    log_path var/"log/prometheus/mysqld_exporter.log"
    error_log_path var/"log/prometheus/mysqld_exporter.err.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mysqld_exporter --version")
  end
end
