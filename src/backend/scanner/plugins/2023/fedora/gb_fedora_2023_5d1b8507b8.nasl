# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885434");
  script_cve_id("CVE-2023-6508", "CVE-2023-6509", "CVE-2023-6510", "CVE-2023-6511", "CVE-2023-6512");
  script_tag(name:"creation_date", value:"2023-12-10 02:17:01 +0000 (Sun, 10 Dec 2023)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-12-11 19:16:22 +0000 (Mon, 11 Dec 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2023-5d1b8507b8)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-5d1b8507b8");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-5d1b8507b8");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2251884");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2252874");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2253150");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2253153");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2253156");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2253160");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2253163");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'chromium' package(s) announced via the FEDORA-2023-5d1b8507b8 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Update to 120.0.6099.62, upstream release fixes follow security issues:

* High CVE-2023-6508: Use after free in Media Stream
* High CVE-2023-6509: Use after free in Side Panel Search
* Medium CVE-2023-6510: Use after free in Media Capture
* Low CVE-2023-6511: Inappropriate implementation in Autofill
* Low CVE-2023-6512: Inappropriate implementation in Web Browser UI");

  script_tag(name:"affected", value:"'chromium' package(s) on Fedora 39.");

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

if(release == "FC39") {

  if(!isnull(res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium", rpm:"chromium~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-common", rpm:"chromium-common~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-common-debuginfo", rpm:"chromium-common-debuginfo~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-headless", rpm:"chromium-headless~120.0.6099.62~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-headless-debuginfo", rpm:"chromium-headless-debuginfo~120.0.6099.62~1.fc39", rls:"FC39"))) {
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
