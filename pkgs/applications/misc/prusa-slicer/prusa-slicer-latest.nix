{ pkgs, lib, ... }:

let
  pname = "prusa-slicer";
  version = "2.6.0-alpha5-appimage";
  name = "${pname}-${version}";

  src = pkgs.fetchurl {
    url = "https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.6.0-alpha5/PrusaSlicer-2.6.0-alpha5+linux-x64-GTK3-202303061441.AppImage";
    sha256 = "3cda15b59200c5e6e9af8bc3cb6c5c099e5236152d7500138f0cc75f859cfefe";
  };

  appimageContents = pkgs.appimageTools.extractType2 { inherit name src; };
in
pkgs.appimageTools.wrapType2 rec {
  inherit name src;

  extraInstallCommands = ''
  '';

  meta = with lib; {
    description = "G-code generator for 3D printer";
    homepage = "https://github.com/prusa3d/PrusaSlicer";
    license = licenses.agpl3;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
  };
}
