{ lib, stdenv, buildGoModule, fetchFromGitHub, git }:

buildGoModule rec {
  pname = "opforjellyfin";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "tissla";
    repo = "opforjellyfin";
    rev = "79b36afe571edd4187323672c18a7feb46642555";
    hash = "sha256-ME73VSc0OaiyKkZDmiiUm5+5od/sdhvtjFAFvQeqHS8=";
  };

  vendorHash = "sha256-PL42t4SywbXmpPtetau03AsTHAGmhOrajsSyF4LJwUU=";
  nativeBuildInputs = [ git ];
  propagatedBuildInputs = [ git ];

  postInstall = ''
    mv $out/bin/opforjellyfin $out/bin/opfor
  '';

  meta = with lib; {
    description = "CLI to automate download and organisation of One Pace episodes for Jellyfin";
    homepage = "https://github.com/tissla/opforjellyfin";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = [ nahieluniversal ];
  };
}
