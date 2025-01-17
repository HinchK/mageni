# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.9.2023.910899100974799");
  script_cve_id("CVE-2023-5129");
  script_tag(name:"creation_date", value:"2024-09-10 12:16:00 +0000 (Tue, 10 Sep 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Fedora: Security Advisory (FEDORA-2023-9108cda47c)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-9108cda47c");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-9108cda47c");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2241121");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libwebp' package(s) announced via the FEDORA-2023-9108cda47c advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Backport fix for CVE-2023-5129.");

  script_tag(name:"affected", value:"'libwebp' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"libwebp", rpm:"libwebp~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-debuginfo", rpm:"libwebp-debuginfo~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-debugsource", rpm:"libwebp-debugsource~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-devel", rpm:"libwebp-devel~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-java", rpm:"libwebp-java~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-java-debuginfo", rpm:"libwebp-java-debuginfo~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-tools", rpm:"libwebp-tools~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libwebp-tools-debuginfo", rpm:"libwebp-tools-debuginfo~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mingw32-libwebp", rpm:"mingw32-libwebp~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mingw32-libwebp-debuginfo", rpm:"mingw32-libwebp-debuginfo~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mingw64-libwebp", rpm:"mingw64-libwebp~1.3.2~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mingw64-libwebp-debuginfo", rpm:"mingw64-libwebp-debuginfo~1.3.2~2.fc39", rls:"FC39"))) {
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
