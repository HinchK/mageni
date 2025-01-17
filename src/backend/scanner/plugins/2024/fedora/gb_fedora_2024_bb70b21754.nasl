# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886445");
  script_tag(name:"creation_date", value:"2024-05-27 10:41:01 +0000 (Mon, 27 May 2024)");
  script_version("2024-10-23T05:05:59+0000");
  script_tag(name:"last_modification", value:"2024-10-23 05:05:59 +0000 (Wed, 23 Oct 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Fedora: Security Advisory (FEDORA-2024-bb70b21754)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-bb70b21754");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-bb70b21754");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2274172");
  script_xref(name:"URL", value:"https://github.com/abseil/abseil-cpp/pull/1650");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'abseil-cpp' package(s) announced via the FEDORA-2024-bb70b21754 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Update to 20240116.2: fixes possible out-of-bounds string access as described in [link moved to references].");

  script_tag(name:"affected", value:"'abseil-cpp' package(s) on Fedora 40.");

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

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp", rpm:"abseil-cpp~20240116.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp-debuginfo", rpm:"abseil-cpp-debuginfo~20240116.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp-debugsource", rpm:"abseil-cpp-debugsource~20240116.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp-devel", rpm:"abseil-cpp-devel~20240116.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp-testing", rpm:"abseil-cpp-testing~20240116.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"abseil-cpp-testing-debuginfo", rpm:"abseil-cpp-testing-debuginfo~20240116.2~1.fc40", rls:"FC40"))) {
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
