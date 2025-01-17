# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.6966.2");
  script_cve_id("CVE-2024-7518", "CVE-2024-7519", "CVE-2024-7520", "CVE-2024-7521", "CVE-2024-7522", "CVE-2024-7524", "CVE-2024-7525", "CVE-2024-7526", "CVE-2024-7527", "CVE-2024-7528", "CVE-2024-7529", "CVE-2024-7530", "CVE-2024-7531");
  script_tag(name:"creation_date", value:"2024-08-21 10:36:07 +0000 (Wed, 21 Aug 2024)");
  script_version("2024-08-22T05:05:50+0000");
  script_tag(name:"last_modification", value:"2024-08-22 05:05:50 +0000 (Thu, 22 Aug 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-12 16:04:20 +0000 (Mon, 12 Aug 2024)");

  script_name("Ubuntu: Security Advisory (USN-6966-2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU20\.04\ LTS");

  script_xref(name:"Advisory-ID", value:"USN-6966-2");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-6966-2");
  script_xref(name:"URL", value:"https://launchpad.net/bugs/2077485");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'firefox' package(s) announced via the USN-6966-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-6966-1 fixed vulnerabilities in Firefox. The update introduced
several minor regressions. This update fixes the problem.

We apologize for the inconvenience.

Original advisory details:

 Multiple security issues were discovered in Firefox. If a user were
 tricked into opening a specially crafted website, an attacker could
 potentially exploit these to cause a denial of service, obtain sensitive
 information across domains, or execute arbitrary code. (CVE-2024-7518,
 CVE-2024-7521, CVE-2024-7524, CVE-2024-7526, CVE-2024-7527, CVE-2024-7528,
 CVE-2024-7529, CVE-2024-7530, CVE-2024-7531)

 It was discovered that Firefox did not properly manage certain memory
 operations when processing graphics shared memory. An attacker could
 potentially exploit this issue to escape the sandbox. (CVE-2024-7519)

 Nan Wang discovered that Firefox did not properly handle type check in
 WebAssembly. An attacker could potentially exploit this issue to execute
 arbitrary code. (CVE-2024-7520)

 Irvan Kurniawan discovered that Firefox did not properly check an
 attribute value in the editor component, leading to an out-of-bounds read
 vulnerability. An attacker could possibly use this issue to cause a denial
 of service or expose sensitive information. (CVE-2024-7522)

 Rob Wu discovered that Firefox did not properly check permissions when
 creating a StreamFilter. An attacker could possibly use this issue to
 modify response body of requests on any site using a web extension.
 (CVE-2024-7525)");

  script_tag(name:"affected", value:"'firefox' package(s) on Ubuntu 20.04.");

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

  if(!isnull(res = isdpkgvuln(pkg:"firefox", ver:"129.0.2+build1-0ubuntu0.20.04.1", rls:"UBUNTU20.04 LTS"))) {
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
