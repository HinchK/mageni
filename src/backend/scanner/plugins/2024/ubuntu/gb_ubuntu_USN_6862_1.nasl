# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.6862.1");
  script_cve_id("CVE-2024-5688", "CVE-2024-5689", "CVE-2024-5690", "CVE-2024-5691", "CVE-2024-5693", "CVE-2024-5694", "CVE-2024-5695", "CVE-2024-5696", "CVE-2024-5697", "CVE-2024-5698", "CVE-2024-5699", "CVE-2024-5700", "CVE-2024-5701");
  script_tag(name:"creation_date", value:"2024-07-04 04:08:00 +0000 (Thu, 04 Jul 2024)");
  script_version("2024-09-16T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-16 05:05:46 +0000 (Mon, 16 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-09-13 18:31:42 +0000 (Fri, 13 Sep 2024)");

  script_name("Ubuntu: Security Advisory (USN-6862-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU20\.04\ LTS");

  script_xref(name:"Advisory-ID", value:"USN-6862-1");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-6862-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'firefox' package(s) announced via the USN-6862-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Multiple security issues were discovered in Firefox. If a user were
tricked into opening a specially crafted website, an attacker could
potentially exploit these to cause a denial of service, obtain sensitive
information across domains, or execute arbitrary code. (CVE-2024-5689,
CVE-2024-5690, CVE-2024-5691, CVE-2024-5693, CVE-2024-5697, CVE-2024-5698,
CVE-2024-5699, CVE-2024-5700, CVE-2024-5701)

Lukas Bernhard discovered that Firefox did not properly manage memory
during garbage collection. An attacker could potentially exploit this
issue to cause a denial of service, or execute arbitrary code.
(CVE-2024-5688)

Lukas Bernhard discovered that Firefox did not properly manage memory in
the JavaScript engine. An attacker could potentially exploit this issue to
obtain sensitive information. (CVE-2024-5694)

Irvan Kurniawan discovered that Firefox did not properly handle certain
allocations in the probabilistic heap checker. An attacker could
potentially exploit this issue to cause a denial of service.
(CVE-2024-5695)

Irvan Kurniawan discovered that Firefox did not properly handle certain
text fragments in input tags. An attacker could potentially exploit this
issue to cause a denial of service. (CVE-2024-5696)");

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

  if(!isnull(res = isdpkgvuln(pkg:"firefox", ver:"127.0.2+build1-0ubuntu0.20.04.1", rls:"UBUNTU20.04 LTS"))) {
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
