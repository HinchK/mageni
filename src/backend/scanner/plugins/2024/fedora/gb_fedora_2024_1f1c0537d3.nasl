# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.9.2024.110219905371003");
  script_cve_id("CVE-2024-27834", "CVE-2024-40776", "CVE-2024-40779", "CVE-2024-40780", "CVE-2024-40782", "CVE-2024-40789");
  script_tag(name:"creation_date", value:"2024-09-10 12:16:00 +0000 (Tue, 10 Sep 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:N/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-23 15:38:01 +0000 (Fri, 23 Aug 2024)");

  script_name("Fedora: Security Advisory (FEDORA-2024-1f1c0537d3)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-1f1c0537d3");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-1f1c0537d3");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2282416");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2301845");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2302091");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2302092");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2302098");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2302105");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'webkit2gtk4.0' package(s) announced via the FEDORA-2024-1f1c0537d3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Update to 2.44.3");

  script_tag(name:"affected", value:"'webkit2gtk4.0' package(s) on Fedora 40.");

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

  if(!isnull(res = isrpmvuln(pkg:"javascriptcoregtk4.0", rpm:"javascriptcoregtk4.0~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"javascriptcoregtk4.0-debuginfo", rpm:"javascriptcoregtk4.0-debuginfo~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"javascriptcoregtk4.0-devel", rpm:"javascriptcoregtk4.0-devel~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"javascriptcoregtk4.0-devel-debuginfo", rpm:"javascriptcoregtk4.0-devel-debuginfo~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0", rpm:"webkit2gtk4.0~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0-debuginfo", rpm:"webkit2gtk4.0-debuginfo~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0-debugsource", rpm:"webkit2gtk4.0-debugsource~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0-devel", rpm:"webkit2gtk4.0-devel~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0-devel-debuginfo", rpm:"webkit2gtk4.0-devel-debuginfo~2.44.3~2.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"webkit2gtk4.0-doc", rpm:"webkit2gtk4.0-doc~2.44.3~2.fc40", rls:"FC40"))) {
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
