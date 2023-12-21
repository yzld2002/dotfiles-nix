{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      twemoji-color-font
      sarasa-gothic
    ];
    fontconfig = {
      localConf = ''
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!--字体设定 -->
    <match target="font">
        <edit name="embeddedbitmap" mode="assign">
            <bool>false</bool>
        </edit>
    </match>
    <match>
        <test qual="any" name="family">
            <string>serif</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>sans-serif</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>monospace</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
    <match>
        <test name="lang" compare="contains">
            <string>zh</string>
        </test>
        <test name="family">
            <string>serif</string>
        </test>
        <edit name="family" mode="prepend">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>
    <match>
        <test name="lang" compare="contains">
            <string>zh</string>
        </test>
        <test name="family">
            <string>sans-serif</string>
        </test>
        <edit name="family" mode="prepend">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>
    <match>
        <test name="lang" compare="contains">
            <string>zh</string>
        </test>
        <test name="family">
            <string>monospace</string>
        </test>
        <edit name="family" mode="prepend">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>

    <!--字体替换 -->
    <match target="pattern">
        <test qual="any" name="family">
            <string>Noto Sans CJK SC</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>文泉驿微米黑</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>SimSun</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>SimHei</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>Microsoft Yahei</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>SimKai</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>宋体</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>楷体</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>黑体</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>微软雅黑</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>更纱黑体 UI SC</string>
        </edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family">
            <string>Noto Mono</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>Noto Sans Mono</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>Monospace</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>Ubuntu Mono</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family">
            <string>Noto Sans Mono CJK SC</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>等距更纱黑体 SC</string>
        </edit>
    </match>
</fontconfig>
      '';
    };
  };

}
