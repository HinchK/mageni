# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886510");
  script_cve_id("CVE-2023-5752");
  script_tag(name:"creation_date", value:"2024-05-27 10:42:21 +0000 (Mon, 27 May 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"1.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:N/I:P/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-11-03 14:55:50 +0000 (Fri, 03 Nov 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2024-dada06a500)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-dada06a500");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-dada06a500");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2250765");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2250771");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'pypy' package(s) announced via the FEDORA-2024-dada06a500 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Security fix for CVE-2023-5752 (in the bundled pip).");

  script_tag(name:"affected", value:"'pypy' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"pypy", rpm:"pypy~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-debuginfo", rpm:"pypy-debuginfo~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-debugsource", rpm:"pypy-debugsource~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-debugsource-debuginfo", rpm:"pypy-debugsource-debuginfo~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-devel", rpm:"pypy-devel~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-libs", rpm:"pypy-libs~7.3.15~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pypy-libs-debuginfo", rpm:"pypy-libs-debuginfo~7.3.15~3.fc39", rls:"FC39"))) {
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
