# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.1.1.2023.5550");
  script_cve_id("CVE-2023-39357", "CVE-2023-39359", "CVE-2023-39361", "CVE-2023-39362", "CVE-2023-39364", "CVE-2023-39365", "CVE-2023-39513", "CVE-2023-39515", "CVE-2023-39516");
  script_tag(name:"creation_date", value:"2023-11-09 04:23:21 +0000 (Thu, 09 Nov 2023)");
  script_version("2024-02-02T05:06:10+0000");
  script_tag(name:"last_modification", value:"2024-02-02 05:06:10 +0000 (Fri, 02 Feb 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-09-08 17:42:39 +0000 (Fri, 08 Sep 2023)");

  script_name("Debian: Security Advisory (DSA-5550-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(11|12)");

  script_xref(name:"Advisory-ID", value:"DSA-5550-1");
  script_xref(name:"URL", value:"https://www.debian.org/security/2023/DSA-5550-1");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DSA-5550");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/cacti");

  script_tag(name:"summary", value:"The remote host is missing an update for the Debian 'cacti' package(s) announced via the DSA-5550-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Multiple security vulnerabilities have been discovered in Cacti, a web interface for graphing of monitoring systems, which could result in cross-site scripting, SQL injection, an open redirect or command injection.

For the oldstable distribution (bullseye), these problems have been fixed in version 1.2.16+ds1-2+deb11u2.

For the stable distribution (bookworm), these problems have been fixed in version 1.2.24+ds1-1+deb12u1.

We recommend that you upgrade your cacti packages.

For the detailed security status of cacti please refer to its security tracker page at: [link moved to references]");

  script_tag(name:"affected", value:"'cacti' package(s) on Debian 11, Debian 12.");

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

if(release == "DEB11") {

  if(!isnull(res = isdpkgvuln(pkg:"cacti", ver:"1.2.16+ds1-2+deb11u2", rls:"DEB11"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "DEB12") {

  if(!isnull(res = isdpkgvuln(pkg:"cacti", ver:"1.2.24+ds1-1+deb12u1", rls:"DEB12"))) {
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
