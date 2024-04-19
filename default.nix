{ lib, stdenv }:
stdenv.mkDerivation {
  pname = "sddm-xdm-theme";
  version = "0.0.1";

  src = ./.;

  postInstall = ''
    mkdir -p $out/share/sddm/themes/xdm

    mv theme.conf *.qml *.png $out/share/sddm/themes/xdm
  '';

  meta = with lib; {
    license = licenses.gpl3;
    maintainers = with lib.maintainers; [ zebreus ];
    homepage = "https://github.com/zebreus/sddm-xdm-theme";
    description = "A sddm theme that looks like xdm";
  };
}
