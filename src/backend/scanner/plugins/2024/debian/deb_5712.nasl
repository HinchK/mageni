# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.1.1.2024.5712");
  script_cve_id("CVE-2023-50010", "CVE-2023-51793", "CVE-2023-51794", "CVE-2023-51795", "CVE-2023-51798", "CVE-2024-31585", "CVE-2024-32230");
  script_tag(name:"creation_date", value:"2024-07-01 04:23:32 +0000 (Mon, 01 Jul 2024)");
  script_version("2024-08-23T05:05:37+0000");
  script_tag(name:"last_modification", value:"2024-08-23 05:05:37 +0000 (Fri, 23 Aug 2024)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-22 13:24:40 +0000 (Thu, 22 Aug 2024)");

  script_name("Debian: Security Advisory (DSA-5712-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB12");

  script_xref(name:"Advisory-ID", value:"DSA-5712-1");
  script_xref(name:"URL", value:"https://www.debian.org/security/2024/DSA-5712-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the Debian 'ffmpeg' package(s) announced via the DSA-5712-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"affected", value:"'ffmpeg' package(s) on Debian 12.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "DEB12") {

  if(!isnull(res = isdpkgvuln(pkg:"ffmpeg", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"ffmpeg-doc", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavcodec-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavcodec-extra", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavcodec-extra59", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavcodec59", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavdevice-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavdevice59", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavfilter-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavfilter-extra", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavfilter-extra8", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavfilter8", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavformat-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavformat-extra", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavformat-extra59", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavformat59", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavutil-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libavutil57", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libpostproc-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libpostproc56", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libswresample-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libswresample4", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libswscale-dev", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libswscale6", ver:"7:5.1.5-0+deb12u1", rls:"DEB12"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
