# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.10.2024.0275");
  script_cve_id("CVE-2024-21141", "CVE-2024-21161", "CVE-2024-21164");
  script_tag(name:"creation_date", value:"2024-07-30 04:12:07 +0000 (Tue, 30 Jul 2024)");
  script_version("2024-07-30T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-07-30 05:05:46 +0000 (Tue, 30 Jul 2024)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:M/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-07-16 23:15:15 +0000 (Tue, 16 Jul 2024)");

  script_name("Mageia: Security Advisory (MGASA-2024-0275)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Mageia Linux Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release", re:"ssh/login/release=MAGEIA9");

  script_xref(name:"Advisory-ID", value:"MGASA-2024-0275");
  script_xref(name:"URL", value:"https://advisories.mageia.org/MGASA-2024-0275.html");
  script_xref(name:"URL", value:"https://bugs.mageia.org/show_bug.cgi?id=33408");
  script_xref(name:"URL", value:"https://www.oracle.com/security-alerts/cpujul2024.html#AppendixOVIR");
  script_xref(name:"URL", value:"https://www.virtualbox.org/wiki/Changelog-7.0#v20");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'kmod-virtualbox, virtualbox' package(s) announced via the MGASA-2024-0275 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Easily exploitable vulnerability allows high privileged attacker with
logon to the infrastructure where Oracle VM VirtualBox executes to
compromise Oracle VM VirtualBox. While the vulnerability is in Oracle VM
VirtualBox, attacks may significantly impact additional products (scope
change). Successful attacks of this vulnerability can result in takeover
of Oracle VM VirtualBox. CVSS 3.1 Base Score 8.2 (Confidentiality,
Integrity and Availability impacts). CVSS Vector:
(CVSS:3.1/AV:L/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H).");

  script_tag(name:"affected", value:"'kmod-virtualbox, virtualbox' package(s) on Mageia 9.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "MAGEIA9") {

  if(!isnull(res = isrpmvuln(pkg:"dkms-virtualbox", rpm:"dkms-virtualbox~7.0.20~1.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kmod-virtualbox", rpm:"kmod-virtualbox~7.0.20~51.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-virtualbox", rpm:"python-virtualbox~7.0.20~1.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox", rpm:"virtualbox~7.0.20~1.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-devel", rpm:"virtualbox-devel~7.0.20~1.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-guest-additions", rpm:"virtualbox-guest-additions~7.0.20~1.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-kernel-6.6.37-desktop-1.mga9", rpm:"virtualbox-kernel-6.6.37-desktop-1.mga9~7.0.20~51.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-kernel-6.6.37-server-1.mga9", rpm:"virtualbox-kernel-6.6.37-server-1.mga9~7.0.20~51.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-kernel-desktop-latest", rpm:"virtualbox-kernel-desktop-latest~7.0.20~51.mga9", rls:"MAGEIA9"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"virtualbox-kernel-server-latest", rpm:"virtualbox-kernel-server-latest~7.0.20~51.mga9", rls:"MAGEIA9"))) {
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
