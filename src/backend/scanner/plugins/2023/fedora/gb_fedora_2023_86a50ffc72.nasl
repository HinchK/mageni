# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885227");
  script_cve_id("CVE-2023-34058", "CVE-2023-34059");
  script_tag(name:"creation_date", value:"2023-11-08 02:14:46 +0000 (Wed, 08 Nov 2023)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:A/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-11-07 21:07:45 +0000 (Tue, 07 Nov 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2023-86a50ffc72)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-86a50ffc72");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-86a50ffc72");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2246080");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2246096");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2246962");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2246963");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'open-vm-tools' package(s) announced via the FEDORA-2023-86a50ffc72 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Security fixes for CVE-2023-34058 and CVE-2023-34059");

  script_tag(name:"affected", value:"'open-vm-tools' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools", rpm:"open-vm-tools~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-debuginfo", rpm:"open-vm-tools-debuginfo~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-debugsource", rpm:"open-vm-tools-debugsource~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-desktop", rpm:"open-vm-tools-desktop~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-desktop-debuginfo", rpm:"open-vm-tools-desktop-debuginfo~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-devel", rpm:"open-vm-tools-devel~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-salt-minion", rpm:"open-vm-tools-salt-minion~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-sdmp", rpm:"open-vm-tools-sdmp~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-sdmp-debuginfo", rpm:"open-vm-tools-sdmp-debuginfo~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-test", rpm:"open-vm-tools-test~12.3.0~3.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"open-vm-tools-test-debuginfo", rpm:"open-vm-tools-test-debuginfo~12.3.0~3.fc39", rls:"FC39"))) {
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
