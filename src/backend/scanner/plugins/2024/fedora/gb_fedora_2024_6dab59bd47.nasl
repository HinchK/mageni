# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886536");
  script_cve_id("CVE-2024-2004", "CVE-2024-2398");
  script_tag(name:"creation_date", value:"2024-05-27 10:42:50 +0000 (Mon, 27 May 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Fedora: Security Advisory (FEDORA-2024-6dab59bd47)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-6dab59bd47");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-6dab59bd47");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2270498");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2270500");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2271824");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2271826");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'curl' package(s) announced via the FEDORA-2024-6dab59bd47 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"- fix Usage of disabled protocol (CVE-2024-2004)
- fix HTTP/2 push headers memory-leak (CVE-2024-2398)");

  script_tag(name:"affected", value:"'curl' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"curl", rpm:"curl~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"curl-debuginfo", rpm:"curl-debuginfo~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"curl-debugsource", rpm:"curl-debugsource~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"curl-minimal", rpm:"curl-minimal~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"curl-minimal-debuginfo", rpm:"curl-minimal-debuginfo~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libcurl", rpm:"libcurl~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libcurl-debuginfo", rpm:"libcurl-debuginfo~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libcurl-devel", rpm:"libcurl-devel~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libcurl-minimal", rpm:"libcurl-minimal~8.2.1~5.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libcurl-minimal-debuginfo", rpm:"libcurl-minimal-debuginfo~8.2.1~5.fc39", rls:"FC39"))) {
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
