# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.6923.2");
  script_cve_id("CVE-2023-52752", "CVE-2024-25742", "CVE-2024-26886", "CVE-2024-26952", "CVE-2024-27017", "CVE-2024-36016");
  script_tag(name:"creation_date", value:"2024-07-31 04:07:34 +0000 (Wed, 31 Jul 2024)");
  script_version("2024-07-31T05:05:34+0000");
  script_tag(name:"last_modification", value:"2024-07-31 05:05:34 +0000 (Wed, 31 Jul 2024)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-05-23 19:14:05 +0000 (Thu, 23 May 2024)");

  script_name("Ubuntu: Security Advisory (USN-6923-2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(20\.04\ LTS|22\.04\ LTS)");

  script_xref(name:"Advisory-ID", value:"USN-6923-2");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-6923-2");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-aws-5.15, linux-ibm, linux-ibm-5.15, linux-raspi' package(s) announced via the USN-6923-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Benedict Schluter, Supraja Sridhara, Andrin Bertschi, and Shweta Shinde
discovered that an untrusted hypervisor could inject malicious #VC
interrupts and compromise the security guarantees of AMD SEV-SNP. This flaw
is known as WeSee. A local attacker in control of the hypervisor could use
this to expose sensitive information or possibly execute arbitrary code in
the trusted execution environment. (CVE-2024-25742)

Several security issues were discovered in the Linux kernel.
An attacker could possibly use these to compromise the system.
This update corrects flaws in the following subsystems:
 - TTY drivers,
 - SMB network file system,
 - Netfilter,
 - Bluetooth subsystem,
(CVE-2024-26886, CVE-2023-52752, CVE-2024-36016, CVE-2024-26952,
CVE-2024-27017)");

  script_tag(name:"affected", value:"'linux-aws-5.15, linux-ibm, linux-ibm-5.15, linux-raspi' package(s) on Ubuntu 20.04, Ubuntu 22.04.");

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

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-5.15.0-1059-ibm", ver:"5.15.0-1059.62~20.04.1", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-5.15.0-1066-aws", ver:"5.15.0-1066.72~20.04.1", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-aws", ver:"5.15.0.1066.72~20.04.1", rls:"UBUNTU20.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-ibm", ver:"5.15.0.1059.62~20.04.1", rls:"UBUNTU20.04 LTS"))) {
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

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-5.15.0-1059-ibm", ver:"5.15.0-1059.62", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-5.15.0-1059-raspi", ver:"5.15.0-1059.62", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-ibm", ver:"5.15.0.1059.55", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-raspi", ver:"5.15.0.1059.57", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-raspi-nolpae", ver:"5.15.0.1059.57", rls:"UBUNTU22.04 LTS"))) {
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
