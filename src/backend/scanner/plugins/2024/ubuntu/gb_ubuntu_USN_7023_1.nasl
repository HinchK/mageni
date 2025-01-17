# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.7023.1");
  script_cve_id("CVE-2023-25815", "CVE-2024-32002", "CVE-2024-32004", "CVE-2024-32020", "CVE-2024-32021", "CVE-2024-32465");
  script_tag(name:"creation_date", value:"2024-09-20 04:08:05 +0000 (Fri, 20 Sep 2024)");
  script_version("2024-09-20T05:05:37+0000");
  script_tag(name:"last_modification", value:"2024-09-20 05:05:37 +0000 (Fri, 20 Sep 2024)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-05-23 20:40:28 +0000 (Thu, 23 May 2024)");

  script_name("Ubuntu: Security Advisory (USN-7023-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(16\.04\ LTS|18\.04\ LTS)");

  script_xref(name:"Advisory-ID", value:"USN-7023-1");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-7023-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'git' package(s) announced via the USN-7023-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Maxime Escourbiac and Yassine Bengana discovered that Git incorrectly
handled some gettext machinery. An attacker could possibly use this issue
to allows the malicious placement of crafted messages. This issue was fixed
in Ubuntu 16.04 LTS. (CVE-2023-25815)

It was discovered that Git incorrectly handled certain submodules.
An attacker could possibly use this issue to execute arbitrary code.
This issue was fixed in Ubuntu 18.04 LTS. (CVE-2024-32002)

It was discovered that Git incorrectly handled certain cloned repositories.
An attacker could possibly use this issue to execute arbitrary code. This
issue was fixed in Ubuntu 18.04 LTS. (CVE-2024-32004, CVE-2024-32465)

It was discovered that Git incorrectly handled local clones with hardlinked
files/directories. An attacker could possibly use this issue to place a
specialized repository on their target's local system. This issue was fixed
in Ubuntu 18.04 LTS. (CVE-2024-32020)

It was discovered that Git incorrectly handled certain symlinks. An
attacker could possibly use this issue to impact availability and
integrity creating hardlinked arbitrary files into users repository's
objects/directory. This issue was fixed in Ubuntu 18.04 LTS.
(CVE-2024-32021)");

  script_tag(name:"affected", value:"'git' package(s) on Ubuntu 16.04, Ubuntu 18.04.");

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

if(release == "UBUNTU16.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"git", ver:"1:2.7.4-0ubuntu1.10+esm8", rls:"UBUNTU16.04 LTS"))) {
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

  if(!isnull(res = isdpkgvuln(pkg:"git", ver:"1:2.17.1-1ubuntu0.18+esm1", rls:"UBUNTU18.04 LTS"))) {
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
