# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.1.1.2024.5760");
  script_cve_id("CVE-2024-29506", "CVE-2024-29507", "CVE-2024-29508", "CVE-2024-29509");
  script_tag(name:"creation_date", value:"2024-08-30 04:23:30 +0000 (Fri, 30 Aug 2024)");
  script_version("2024-08-30T05:05:38+0000");
  script_tag(name:"last_modification", value:"2024-08-30 05:05:38 +0000 (Fri, 30 Aug 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-02 20:10:32 +0000 (Fri, 02 Aug 2024)");

  script_name("Debian: Security Advisory (DSA-5760-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB12");

  script_xref(name:"Advisory-ID", value:"DSA-5760-1");
  script_xref(name:"URL", value:"https://www.debian.org/security/2024/DSA-5760-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the Debian 'ghostscript' package(s) announced via the DSA-5760-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"affected", value:"'ghostscript' package(s) on Debian 12.");

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

  if(!isnull(res = isdpkgvuln(pkg:"ghostscript", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"ghostscript-doc", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"ghostscript-x", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libgs-common", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libgs-dev", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libgs10", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libgs10-common", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libgs9-common", ver:"10.0.0~dfsg-11+deb12u5", rls:"DEB12"))) {
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
