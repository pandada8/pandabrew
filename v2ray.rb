class V2ray < Formula
  desc "V2Ray provides building blocks for network proxy development."
  homepage "https://github.com/v2ray/v2ray-core"
  url "https://github.com/v2ray/v2ray-core/releases/download/v2.2.1/v2ray-macos.zip"
  version "2.2.1"
  sha256 "fb8871986a175dc065a2cd608b614ca3ea907d9ef82dd396196d3938c4b80c19"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
        <key>ProgramArguments</key>
        <array>
            <string>#{bin}/v2ray</string>
            <string>-config</string>
            <string>#{etc}/config.json</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    bin.install "v2ray"
    etc.install "config.json"
  end
end
