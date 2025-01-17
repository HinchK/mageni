# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.6851.1");
  script_cve_id("CVE-2022-4968");
  script_tag(name:"creation_date", value:"2024-06-27 04:08:30 +0000 (Thu, 27 Jun 2024)");
  script_version("2024-11-01T05:05:36+0000");
  script_tag(name:"last_modification", value:"2024-11-01 05:05:36 +0000 (Fri, 01 Nov 2024)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:C/I:N/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:C/C:H/I:N/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-10-30 13:56:32 +0000 (Wed, 30 Oct 2024)");

  script_name("Ubuntu: Security Advisory (USN-6851-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(20\.04\ LTS|22\.04\ LTS|23\.10|24\.04\ LTS)");

  script_xref(name:"Advisory-ID", value:"USN-6851-1");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-6851-1");
  script_xref(name:"URL", value:"https://launchpad.net/bugs/1987842");
  script_xref(name:"URL", value:"https://launchpad.net/bugs/2065738");
  script_xref(name:"URL", value:"https://launchpad.net/bugs/2066258");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'netplan.io' package(s) announced via the USN-6851-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Andreas Hasenack discovered that netplan incorrectly handled the permissions
for netdev files containing wireguard configuration. An attacker could use this to obtain
wireguard secret keys.

It was discovered that netplan configuration could be manipulated into injecting
arbitrary commands while setting up network interfaces. An attacker could
use this to execute arbitrary commands or escalate privileges.");

  script_tag(name:"affected", value:"'netplan.io' package(s) on Ubuntu 20.04, Ubuntu 22.04, Ubuntu 23.10, Ubuntu 24.04.");

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

if(release == "UBUNTU20.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libnetplan0", ver:"0.104-0ubuntu2~20.04.5", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan.io", ver:"0.104-0ubuntu2~20.04.5", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU22.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libnetplan0", ver:"0.106.1-7ubuntu0.22.04.3", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan.io", ver:"0.106.1-7ubuntu0.22.04.3", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU23.10") {

  if(!isnull(res = isdpkgvuln(pkg:"libnetplan0", ver:"0.107-5ubuntu0.3", rls:"UBUNTU23.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan-generator", ver:"0.107-5ubuntu0.3", rls:"UBUNTU23.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan.io", ver:"0.107-5ubuntu0.3", rls:"UBUNTU23.10"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU24.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"libnetplan1", ver:"1.0-2ubuntu1.1", rls:"UBUNTU24.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan-generator", ver:"1.0-2ubuntu1.1", rls:"UBUNTU24.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"netplan.io", ver:"1.0-2ubuntu1.1", rls:"UBUNTU24.04 LTS"))) {
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
