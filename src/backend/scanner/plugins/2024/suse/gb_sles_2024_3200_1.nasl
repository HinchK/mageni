# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.3200.1");
  script_cve_id("CVE-2024-6923");
  script_tag(name:"creation_date", value:"2024-09-11 12:10:13 +0000 (Wed, 11 Sep 2024)");
  script_version("2024-09-12T07:59:53+0000");
  script_tag(name:"last_modification", value:"2024-09-12 07:59:53 +0000 (Thu, 12 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:3200-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES15\.0SP4)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3200-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20243200-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python311' package(s) announced via the SUSE-SU-2024:3200-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for python311 fixes the following issues:

CVE-2024-6923: Fixed email header injection due to unquoted newlines (bsc#1228780)

Other fixes:
- %{profileopt} variable is set according to the variable %{do_profiling} (bsc#1227999)
- Stop using %%defattr, it seems to be breaking proper executable attributes on /usr/bin/ scripts (bsc#1227378)
- Make pip and modern tools install directly in /usr/local when used by the user (bsc#1225660)");

  script_tag(name:"affected", value:"'python311' package(s) on SUSE Linux Enterprise Desktop 15-SP4, SUSE Linux Enterprise High Performance Computing 15-SP4, SUSE Linux Enterprise Server 15-SP4, SUSE Linux Enterprise Server for SAP Applications 15-SP4.");

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

if(release == "SLES15.0SP4") {

  if(!isnull(res = isrpmvuln(pkg:"libpython3_11-1_0", rpm:"libpython3_11-1_0~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpython3_11-1_0-debuginfo", rpm:"libpython3_11-1_0-debuginfo~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311", rpm:"python311~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-base", rpm:"python311-base~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-base-debuginfo", rpm:"python311-base-debuginfo~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-core-debugsource", rpm:"python311-core-debugsource~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-curses", rpm:"python311-curses~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-curses-debuginfo", rpm:"python311-curses-debuginfo~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-dbm", rpm:"python311-dbm~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-dbm-debuginfo", rpm:"python311-dbm-debuginfo~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-debuginfo", rpm:"python311-debuginfo~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-debugsource", rpm:"python311-debugsource~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-devel", rpm:"python311-devel~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-doc", rpm:"python311-doc~3.11.9~150400.9.32.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-doc-devhelp", rpm:"python311-doc-devhelp~3.11.9~150400.9.32.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-idle", rpm:"python311-idle~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-tk", rpm:"python311-tk~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-tk-debuginfo", rpm:"python311-tk-debuginfo~3.11.9~150400.9.32.4", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python311-tools", rpm:"python311-tools~3.11.9~150400.9.32.3", rls:"SLES15.0SP4"))) {
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
