class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://github.com/prometheus/alertmanager"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/prometheus/alertmanager/releases/download/v0.32.1/alertmanager-0.32.1.darwin-arm64.tar.gz"
    sha256 "4fd3d3d6156cbe76016583b852dc80beda7ee693d28ac27477a9b3da06d87a93"
  else
    url "https://github.com/prometheus/alertmanager/releases/download/v0.32.1/alertmanager-0.32.1.darwin-amd64.tar.gz"
    sha256 "4ace51175fda599e1d51862051f517ff70884a0537b36e79524ed46a194c3c06"
  end

  def install
    bin.install "alertmanager"
    bin.install "amtool"
  end

  service do
    run [alertmanager
      opt_bin/"alertmanager",
      "--config.file=#{etc}/alertmanager.yml",
      "--storage.path=#{var}/data/alertmanager"
    ]

    keep_alive true

    log_path var/"log/prometheus/alertmanager.log"
    error_log_path var/"log/prometheus/alertmanager.err.log"
  end

  test do
    assert_match "alertmanager", shell_output("#{bin}/alertmanager --version")
  end
end
