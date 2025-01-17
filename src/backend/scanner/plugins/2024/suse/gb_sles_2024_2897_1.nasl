# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.2897.1");
  script_cve_id("CVE-2024-6655");
  script_tag(name:"creation_date", value:"2024-08-14 04:25:53 +0000 (Wed, 14 Aug 2024)");
  script_version("2024-08-14T05:05:52+0000");
  script_tag(name:"last_modification", value:"2024-08-14 05:05:52 +0000 (Wed, 14 Aug 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:2897-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES15\.0SP2|SLES15\.0SP3)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:2897-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20242897-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'gtk2' package(s) announced via the SUSE-SU-2024:2897-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for gtk2 fixes the following issues:

CVE-2024-6655: Fixed library injection from current working directory (bsc#1228120).");

  script_tag(name:"affected", value:"'gtk2' package(s) on SUSE Enterprise Storage 7.1, SUSE Linux Enterprise High Performance Computing 15-SP2, SUSE Linux Enterprise High Performance Computing 15-SP3, SUSE Linux Enterprise Server 15-SP2, SUSE Linux Enterprise Server 15-SP3, SUSE Linux Enterprise Server for SAP Applications 15-SP2, SUSE Linux Enterprise Server for SAP Applications 15-SP3.");

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

if(release == "SLES15.0SP2") {

  if(!isnull(res = isrpmvuln(pkg:"gtk2-data", rpm:"gtk2-data~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-debugsource", rpm:"gtk2-debugsource~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-devel", rpm:"gtk2-devel~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-devel-debuginfo", rpm:"gtk2-devel-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-lang", rpm:"gtk2-lang~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools", rpm:"gtk2-tools~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-32bit", rpm:"gtk2-tools-32bit~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-32bit-debuginfo", rpm:"gtk2-tools-32bit-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-debuginfo", rpm:"gtk2-tools-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0", rpm:"libgtk-2_0-0~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-32bit", rpm:"libgtk-2_0-0-32bit~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-32bit-debuginfo", rpm:"libgtk-2_0-0-32bit-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-debuginfo", rpm:"libgtk-2_0-0-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-Gtk-2_0", rpm:"typelib-1_0-Gtk-2_0~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "SLES15.0SP3") {

  if(!isnull(res = isrpmvuln(pkg:"gtk2-data", rpm:"gtk2-data~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-debugsource", rpm:"gtk2-debugsource~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-devel", rpm:"gtk2-devel~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-devel-debuginfo", rpm:"gtk2-devel-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-lang", rpm:"gtk2-lang~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools", rpm:"gtk2-tools~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-32bit", rpm:"gtk2-tools-32bit~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-32bit-debuginfo", rpm:"gtk2-tools-32bit-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gtk2-tools-debuginfo", rpm:"gtk2-tools-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0", rpm:"libgtk-2_0-0~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-32bit", rpm:"libgtk-2_0-0-32bit~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-32bit-debuginfo", rpm:"libgtk-2_0-0-32bit-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgtk-2_0-0-debuginfo", rpm:"libgtk-2_0-0-debuginfo~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-Gtk-2_0", rpm:"typelib-1_0-Gtk-2_0~2.24.32+67~150200.4.3.1", rls:"SLES15.0SP3"))) {
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
