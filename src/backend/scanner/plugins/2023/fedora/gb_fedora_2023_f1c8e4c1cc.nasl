# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885134");
  script_cve_id("CVE-2023-42114", "CVE-2023-42115", "CVE-2023-42116", "CVE-2023-42117", "CVE-2023-42119");
  script_tag(name:"creation_date", value:"2023-11-05 02:18:58 +0000 (Sun, 05 Nov 2023)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Fedora: Security Advisory (FEDORA-2023-f1c8e4c1cc)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-f1c8e4c1cc");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-f1c8e4c1cc");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241525");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241527");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241528");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241529");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241531");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241532");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241538");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241539");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241542");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241544");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241735");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2244300");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'exim' package(s) announced via the FEDORA-2023-f1c8e4c1cc advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This is new version of exim.

----

This is an exim update fixing several security problems.");

  script_tag(name:"affected", value:"'exim' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"exim", rpm:"exim~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-clamav", rpm:"exim-clamav~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-debuginfo", rpm:"exim-debuginfo~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-debugsource", rpm:"exim-debugsource~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-greylist", rpm:"exim-greylist~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-mon", rpm:"exim-mon~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-mon-debuginfo", rpm:"exim-mon-debuginfo~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-mysql", rpm:"exim-mysql~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-mysql-debuginfo", rpm:"exim-mysql-debuginfo~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-pgsql", rpm:"exim-pgsql~4.96.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"exim-pgsql-debuginfo", rpm:"exim-pgsql-debuginfo~4.96.2~1.fc39", rls:"FC39"))) {
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
