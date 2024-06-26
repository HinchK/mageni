# Copyright (C) 2022 Greenbone Networks GmbH
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.705243");
  script_version("2022-09-29T10:24:47+0000");
  script_cve_id("CVE-2022-37797", "CVE-2022-41556");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2022-09-29 10:24:47 +0000 (Thu, 29 Sep 2022)");
  script_tag(name:"creation_date", value:"2022-09-29 01:00:07 +0000 (Thu, 29 Sep 2022)");
  script_name("Debian: Security Advisory for lighttpd (DSA-5243-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2022 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB11");

  script_xref(name:"URL", value:"https://www.debian.org/security/2022/dsa-5243.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DSA-5243-1");
  script_xref(name:"Advisory-ID", value:"DSA-5243-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'lighttpd'
  package(s) announced via the DSA-5243-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Several vulnerabilities were discovered in lighttpd, a fast webserver
with minimal memory footprint.

CVE-2022-37797
An invalid HTTP request (websocket handshake) may cause a NULL
pointer dereference in the wstunnel module.

CVE-2022-41556
A resource leak in mod_fastcgi and mod_scgi could lead to a denial
of service after a large number of bad HTTP requests.");

  script_tag(name:"affected", value:"'lighttpd' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For the stable distribution (bullseye), these problems have been fixed in
version 1.4.59-1+deb11u2.

We recommend that you upgrade your lighttpd packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"lighttpd", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-doc", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-authn-gssapi", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-authn-pam", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-authn-sasl", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-cml", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-deflate", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-geoip", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-magnet", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-maxminddb", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-mbedtls", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-nss", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-openssl", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-trigger-b4-dl", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-vhostdb-dbi", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-vhostdb-pgsql", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-webdav", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-mod-wolfssl", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-modules-dbi", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-modules-ldap", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-modules-lua", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"lighttpd-modules-mysql", ver:"1.4.59-1+deb11u2", rls:"DEB11"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);
