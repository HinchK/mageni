# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.1169.1");
  script_cve_id("CVE-2024-28085");
  script_tag(name:"creation_date", value:"2024-05-07 13:39:54 +0000 (Tue, 07 May 2024)");
  script_version("2024-05-09T05:05:43+0000");
  script_tag(name:"last_modification", value:"2024-05-09 05:05:43 +0000 (Thu, 09 May 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:1169-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES15\.0SP4)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:1169-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20241169-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'util-linux' package(s) announced via the SUSE-SU-2024:1169-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for util-linux fixes the following issues:

CVE-2024-28085: Properly neutralize escape sequences in wall. (bsc#1221831)");

  script_tag(name:"affected", value:"'util-linux' package(s) on SUSE Linux Enterprise Desktop 15-SP4, SUSE Linux Enterprise High Performance Computing 15-SP4, SUSE Linux Enterprise Micro 5.3, SUSE Linux Enterprise Micro 5.4, SUSE Linux Enterprise Micro for Rancher 5.3, SUSE Linux Enterprise Micro for Rancher 5.4, SUSE Linux Enterprise Server 15-SP4, SUSE Linux Enterprise Server for SAP Applications 15-SP4, SUSE Manager Proxy 4.3, SUSE Manager Retail Branch Server 4.3, SUSE Manager Server 4.3.");

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

  if(!isnull(res = isrpmvuln(pkg:"libblkid-devel", rpm:"libblkid-devel~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libblkid-devel-static", rpm:"libblkid-devel-static~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libblkid1", rpm:"libblkid1~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libblkid1-32bit", rpm:"libblkid1-32bit~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libblkid1-32bit-debuginfo", rpm:"libblkid1-32bit-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libblkid1-debuginfo", rpm:"libblkid1-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libfdisk-devel", rpm:"libfdisk-devel~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libfdisk1", rpm:"libfdisk1~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libfdisk1-debuginfo", rpm:"libfdisk1-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libmount-devel", rpm:"libmount-devel~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libmount1", rpm:"libmount1~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libmount1-32bit", rpm:"libmount1-32bit~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libmount1-32bit-debuginfo", rpm:"libmount1-32bit-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libmount1-debuginfo", rpm:"libmount1-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libsmartcols-devel", rpm:"libsmartcols-devel~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libsmartcols1", rpm:"libsmartcols1~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libsmartcols1-debuginfo", rpm:"libsmartcols1-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid-devel", rpm:"libuuid-devel~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid-devel-static", rpm:"libuuid-devel-static~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid1", rpm:"libuuid1~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid1-32bit", rpm:"libuuid1-32bit~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid1-32bit-debuginfo", rpm:"libuuid1-32bit-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libuuid1-debuginfo", rpm:"libuuid1-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux", rpm:"util-linux~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-debuginfo", rpm:"util-linux-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-debugsource", rpm:"util-linux-debugsource~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-lang", rpm:"util-linux-lang~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-systemd", rpm:"util-linux-systemd~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-systemd-debuginfo", rpm:"util-linux-systemd-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"util-linux-systemd-debugsource", rpm:"util-linux-systemd-debugsource~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"uuidd", rpm:"uuidd~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"uuidd-debuginfo", rpm:"uuidd-debuginfo~2.37.2~150400.8.29.1", rls:"SLES15.0SP4"))) {
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
