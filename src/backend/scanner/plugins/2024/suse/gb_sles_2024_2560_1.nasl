# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.2560.1");
  script_cve_id("CVE-2024-38476");
  script_tag(name:"creation_date", value:"2024-07-19 04:23:48 +0000 (Fri, 19 Jul 2024)");
  script_version("2024-08-22T05:05:50+0000");
  script_tag(name:"last_modification", value:"2024-08-22 05:05:50 +0000 (Thu, 22 Aug 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-21 15:08:56 +0000 (Wed, 21 Aug 2024)");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:2560-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES12\.0SP5)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:2560-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20242560-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'apache2' package(s) announced via the SUSE-SU-2024:2560-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for apache2 fixes the following issues:

CVE-2024-38476: Fixed server may use exploitable/malicious backend application output to run local handlers via internal redirect (bsc#1227269)");

  script_tag(name:"affected", value:"'apache2' package(s) on SUSE Linux Enterprise High Performance Computing 12-SP5, SUSE Linux Enterprise Server 12-SP5, SUSE Linux Enterprise Server for SAP Applications 12-SP5, SUSE Linux Enterprise Software Development Kit 12-SP5.");

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

if(release == "SLES12.0SP5") {

  if(!isnull(res = isrpmvuln(pkg:"apache2", rpm:"apache2~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-debuginfo", rpm:"apache2-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-debugsource", rpm:"apache2-debugsource~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-doc", rpm:"apache2-doc~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-example-pages", rpm:"apache2-example-pages~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-prefork", rpm:"apache2-prefork~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-prefork-debuginfo", rpm:"apache2-prefork-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13", rpm:"apache2-tls13~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-debuginfo", rpm:"apache2-tls13-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-debugsource", rpm:"apache2-tls13-debugsource~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-doc", rpm:"apache2-tls13-doc~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-example-pages", rpm:"apache2-tls13-example-pages~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-prefork", rpm:"apache2-tls13-prefork~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-prefork-debuginfo", rpm:"apache2-tls13-prefork-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-utils", rpm:"apache2-tls13-utils~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-utils-debuginfo", rpm:"apache2-tls13-utils-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-worker", rpm:"apache2-tls13-worker~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-tls13-worker-debuginfo", rpm:"apache2-tls13-worker-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-utils", rpm:"apache2-utils~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-utils-debuginfo", rpm:"apache2-utils-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-worker", rpm:"apache2-worker~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"apache2-worker-debuginfo", rpm:"apache2-worker-debuginfo~2.4.51~35.54.1", rls:"SLES12.0SP5"))) {
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
