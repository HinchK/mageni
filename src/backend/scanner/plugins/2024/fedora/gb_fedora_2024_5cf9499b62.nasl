# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886830");
  script_cve_id("CVE-2024-3833", "CVE-2024-3834", "CVE-2024-3837", "CVE-2024-3839", "CVE-2024-3840", "CVE-2024-3841", "CVE-2024-3843", "CVE-2024-3844", "CVE-2024-3845", "CVE-2024-3846", "CVE-2024-3847", "CVE-2024-3914", "CVE-2024-4058", "CVE-2024-4059", "CVE-2024-4060", "CVE-2024-4331", "CVE-2024-4368");
  script_tag(name:"creation_date", value:"2024-05-27 10:48:46 +0000 (Mon, 27 May 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-06-07 15:40:49 +0000 (Fri, 07 Jun 2024)");

  script_name("Fedora: Security Advisory (FEDORA-2024-5cf9499b62)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-5cf9499b62");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-5cf9499b62");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2275548");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2275815");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2276890");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2276891");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2277228");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'chromium' package(s) announced via the FEDORA-2024-5cf9499b62 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"update to 124.0.6367.118

 * High CVE-2024-4331: Use after free in Picture In Picture
 * High CVE-2024-4368: Use after free in Dawn


----

update to 124.0.6367.91

----

update to 124.0.6367.78

 * Critical CVE-2024-4058: Type Confusion in ANGLE
 * High CVE-2024-4059: Out of bounds read in V8 API
 * High CVE-2024-4060: Use after free in Dawn");

  script_tag(name:"affected", value:"'chromium' package(s) on Fedora 40.");

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

if(release == "FC40") {

  if(!isnull(res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~124.0.6367.118~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium", rpm:"chromium~124.0.6367.118~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-common", rpm:"chromium-common~124.0.6367.118~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-headless", rpm:"chromium-headless~124.0.6367.118~1.fc40", rls:"FC40"))) {
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
