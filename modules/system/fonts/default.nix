{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      twemoji-color-font
      sarasa-gothic
    ];
    fontconfig = {
      localConf = ''
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- 显示器使用的像素排列方式. 现代显示器基本都是用rgb排列. -->
    <match target="font">
      <edit mode="assign" name="rgba">
        <const>rgb</const>
      </edit>
    </match>

    <!-- 字体微调的程度, 可选为 hintnone, hintslight (默认), hintmedium, hintfull. -->
    <!-- 简单来说，更高的 hinting 等级可以使字体更锐利，但同时也会损失更多的细节. -->
    <!-- 如果你的显示器的 DPI 高得不像话 (>=300), 那么就可以关闭 hinting, 因为字体会自然对齐像素. -->
    <match target="font">
      <edit mode="assign" name="hintstyle">
        <const>hintslight</const>
      </edit>
    </match>

    <!-- 抗锯齿. 除非你的屏幕DPI奇高否则建议开启. -->
    <match target="font">
      <edit mode="assign" name="antialias">
        <bool>true</bool>
      </edit>
    </match>
    
    <!-- 关于lcdfilter, 因为我们在使用 FreeType2 自带的 Harmony 子像素渲染, 应该是不需要设置的. -->

    <!-- 将 Liberation 系列对应到我们定义的优先字体上 -->
    <!-- Map fonts that are commonly used by web pages to our preferred fonts -->
    <match target="pattern">
      <test qual="any" name="family"><string>Liberation Sans</string></test>
      <edit name="family" mode="assign" binding="same"><string>sans-serif</string></edit>
    </match>
    
    <match target="pattern">
      <test qual="any" name="family"><string>Liberation Mono</string></test>
      <edit name="family" mode="assign" binding="same"><string>monospace</string></edit>
    </match>

    <!--字体设定 -->
    <!-- 全局默认中文字体 -->
    <!-- Default font for the zh_CN locale (no fc-match pattern) -->
    <match>
      <test compare="contains" name="lang">
        <string>zh_CN</string>
      </test>
      <edit mode="prepend" name="family">
        <!-- 更改下一行即可, 以下同理 -->
        <string>Sarasa Mono SC</string>
      </edit>
    </match>

    <!-- 默认无衬线字体 -->
    <!-- Default sans-serif font -->
    <match target="pattern">
      <test qual="any" name="family">
        <string>sans-serif</string></test>
      <edit name="family" mode="prepend" binding="same">
        <string>Sarasa Mono SC</string>
      </edit>
    </match>

    <!-- 默认衬线字体 -->
    <!-- Default serif fonts -->
    <match target="pattern">
      <test qual="any" name="family">
        <string>serif</string>
      </test>
      <edit name="family" mode="prepend" binding="same">
        <string>Sarasa Mono Slab SC</string>
      </edit>
    </match>

    <!-- 默认等宽字体 -->
    <!-- Default monospace fonts -->
    <match target="pattern">
      <test qual="any" name="family">
        <string>monospace</string>
      </test>
      <edit name="family" mode="prepend" binding="same">
        <string>CaskaydiaCove Nerd Font Mono</string>
      </edit>
    </match>
    <!-- Fallback fonts preference order -->
    <alias>
      <family>sans-serif</family>
      <prefer>
        <family>Sarasa Mono SC</family>
        <family>Sarasa Mono TC</family>
        <family>Sarasa Mono J</family>
        <family>Sarasa Mono K</family>
        <family>Twitter Color Emoji</family>
      </prefer>
    </alias>
    <alias>
      <family>serif</family>
      <prefer>
        <family>Sarasa Mono Slab SC</family>
        <family>Sarasa Mono Slab TC</family>
        <family>Sarasa Mono Slab J</family>
        <family>Sarasa Mono Slab K</family>
        <family>Twitter Color Emoji</family>
      </prefer>
    </alias>
    <alias>
      <family>monospace</family>
      <prefer>
        <family>CaskaydiaCove Nerd Font Mono</family>
        <family>JetBrainsMono Nerd Font Mono</family>
        <family>Twitter Color Emoji</family>
      </prefer>
    </alias>

    <selectfont>
      <rejectfont>
        <pattern>
          <patelt name="family" >
            <!-- This font is causing problem with GitHub -->
            <string>Nimbus Sans</string>
          </patelt>
        </pattern>
      </rejectfont>
    </selectfont>
</fontconfig>
      '';
    };
  };

}
