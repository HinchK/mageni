# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.6958.1");
  script_cve_id("CVE-2017-7960", "CVE-2017-8834", "CVE-2017-8871", "CVE-2020-12825");
  script_tag(name:"creation_date", value:"2024-08-14 04:08:46 +0000 (Wed, 14 Aug 2024)");
  script_version("2024-08-14T05:05:52+0000");
  script_tag(name:"last_modification", value:"2024-08-14 05:05:52 +0000 (Wed, 14 Aug 2024)");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2020-05-18 14:41:14 +0000 (Mon, 18 May 2020)");

  script_name("Ubuntu: Security Advisory (USN-6958-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04\ LTS|18\.04\ LTS|20\.04\ LTS)");

  script_xref(name:"Advisory-ID", value:"USN-6958-1");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-6958-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libcroco' package(s) announced via the USN-6958-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"It was discovered that Libcroco was incorrectly accessing data structures
when reading bytes from memory, which could cause a heap buffer overflow.
An attacker could possibly use this issue to cause a denial of service.
This issue only affected Ubuntu 14.04 LTS. (CVE-2017-7960)

It was discovered that Libcroco was incorrectly handling invalid UTF-8
values when processing CSS files. An attacker could possibly use this
issue to cause a denial of service. (CVE-2017-8834, CVE-2017-8871)

It was discovered that Libcroco was incorrectly implementing recursion in
one of its parsing functions, which could cause an infinite recursion
loop and a stack overflow due to stack consumption. An attacker could
possibly use this issue to cause a denial of service. (CVE-2020-12825)");

  script_tag(name:"affected", value:"'libcroco' package(s) on Ubuntu 14.04, Ubuntu 18.04, Ubuntu 20.04.");

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

if(release == "UBUNTU14.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libcroco-tools", ver:"0.6.8-2ubuntu1+esm1", rls:"UBUNTU14.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libcroco3", ver:"0.6.8-2ubuntu1+esm1", rls:"UBUNTU14.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU18.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libcroco-tools", ver:"0.6.12-2ubuntu0.1~esm1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libcroco3", ver:"0.6.12-2ubuntu0.1~esm1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU20.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libcroco-tools", ver:"0.6.13-1ubuntu0.1", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"libcroco3", ver:"0.6.13-1ubuntu0.1", rls:"UBUNTU20.04 LTS"))) {
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
