# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.9.2023.982401019810099797");
  script_cve_id("CVE-2023-36664");
  script_tag(name:"creation_date", value:"2024-09-10 12:16:00 +0000 (Tue, 10 Sep 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-07-14 14:48:46 +0000 (Fri, 14 Jul 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2023-b240ebd9aa)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-b240ebd9aa");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-b240ebd9aa");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2182090");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2217806");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ghostscript' package(s) announced via the FEDORA-2023-b240ebd9aa advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Automatic update for ghostscript-10.01.2-1.fc39.

##### **Changelog**

```
* Fri Jul 14 2023 Michael J Gruber <mjg@fedoraproject.org> - 10.01.2-1
- rebase to bugfix release 10.01.2 (rhbz#2182090)
- fix for CVE-2023-36664 (rhbz#2217806)

```");

  script_tag(name:"affected", value:"'ghostscript' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"ghostscript", rpm:"ghostscript~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-debuginfo", rpm:"ghostscript-debuginfo~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-debugsource", rpm:"ghostscript-debugsource~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-doc", rpm:"ghostscript-doc~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-gtk", rpm:"ghostscript-gtk~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-gtk-debuginfo", rpm:"ghostscript-gtk-debuginfo~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-tools-dvipdf", rpm:"ghostscript-tools-dvipdf~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-tools-fonts", rpm:"ghostscript-tools-fonts~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-tools-printing", rpm:"ghostscript-tools-printing~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgs", rpm:"libgs~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgs-debuginfo", rpm:"libgs-debuginfo~10.01.2~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgs-devel", rpm:"libgs-devel~10.01.2~1.fc39", rls:"FC39"))) {
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
